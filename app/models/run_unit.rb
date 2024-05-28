# == Schema Information
#
# Table name: run_units
#
#  id                :bigint           not null, primary key
#  description       :string
#  indentation_level :integer          default(0)
#  position          :integer          not null
#  title             :string
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
  validates :indentation_level, numericality: { greater_than_or_equal_to: 0 }

  validate :not_too_deep

  positioned on: :run

  belongs_to :run

  def not_too_deep
    if indentation_level > predecessor.indentation_level + 1
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
end
