# == Schema Information
#
# Table name: run_units
#
#  id                :bigint           not null, primary key
#  description       :string
#  indentation_level :integer          default(0)
#  position          :integer          not null
#  title             :string
#  weight            :integer          default(5)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  run_id            :bigint           not null
#
# Indexes
#
#  index_run_units_on_run_id               (run_id)
#  index_run_units_on_run_id_and_position  (run_id,position) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (run_id => runs.id)
#
class RunUnit < ApplicationRecord
  validates :indentation_level, numericality: {greater_than_or_equal_to: 0}

  validate :not_too_deep

  positioned on: :run

  belongs_to :run

  def not_too_deep
    if position && indentation_level > predecessor.try(:indentation_level).to_i + 1
      errors.add(:indentation_level, "must not be more than one level deeper than its predecessor")
    end
  end

  alias_method :predecessor, :prior_position
  alias_method :successor, :subsequent_position

  def descendants
    result = []
    next_unit = successor

    while next_unit && next_unit.indentation_level > indentation_level
      result << next_unit
      next_unit = next_unit.successor
    end

    result
  end

  def last_descendant
    descendants.last
  end

  def predecessors
    run.run_units.where(position: ...position).order(:position)
  end

  def parent
    predecessors
      .where(indentation_level: indentation_level - 1)
      .last
  end

  def ancestors
    next_ancestor = parent
    result = []

    while next_ancestor
      result << next_ancestor
      next_ancestor = next_ancestor.parent
    end

    result
  end

  def progenitor
    ancestors.last
  end

  def can_outdent?
    indentation_level > 0 || descendants.any?
  end

  def outdent!
    to_outdent = descendants.prepend(self)

    to_outdent.each do |run_unit|
      run_unit.indentation_level -= 1
      run_unit.save
    end
  end

  def can_indent?
    predecessor && indentation_level - predecessor.indentation_level < 1
  end

  def indent!
    to_indent = descendants.prepend(self)

    to_indent.each do |run_unit|
      run_unit.indentation_level += 1
      run_unit.save
    end
  end

  def prior_siblings
    if indentation_level == 0
      run
        .run_units
        .where(indentation_level:)
        .where(position: ...position)
        .order(:position)
    else
      run
        .run_units
        .where(indentation_level:)
        .where(position: parent.position...position)
        .order(:position)
    end
  end

  def last_prior_sibling
    prior_siblings.last
  end

  def can_move_up?
    last_prior_sibling
  end

  def move_up!
    if can_move_up?
      to_move_up = descendants

      update(position: {before: last_prior_sibling})

      anchor = self

      to_move_up.each do |run_unit|
        run_unit.update(position: {after: anchor})

        anchor = run_unit
      end
    end
  end

  def can_move_down?
    run.run_units.order(:position).last != self
  end

  def move_down!
  end

  def weight_fraction_of_parent
    weight.to_f / run.weight_total_of_children
  end

  def weight_fraction_of_parent_percent
    weight_fraction_of_parent * 100
  end

  alias_method :points, :weight_fraction_of_parent_percent

  # Pseudocode for methods we may not need, mostly just to define terminology:

  # def siblings
  #   run.run_units.where(indentation_level:).order(:position)
  # end

  # def successors
  #   run.run_units.where(position: position...).order(:position)
  # end
end
