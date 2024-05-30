# == Schema Information
#
# Table name: run_unit_submissions
#
#  id                :bigint           not null, primary key
#  passing           :boolean          default(FALSE)
#  progress          :float            default(0.0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  run_id            :bigint           not null
#  run_submission_id :bigint           not null
#  run_unit_id       :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_run_unit_submissions_on_run_id             (run_id)
#  index_run_unit_submissions_on_run_submission_id  (run_submission_id)
#  index_run_unit_submissions_on_run_unit_id        (run_unit_id)
#  index_run_unit_submissions_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (run_id => runs.id)
#  fk_rails_...  (run_submission_id => run_submissions.id)
#  fk_rails_...  (run_unit_id => run_units.id)
#  fk_rails_...  (user_id => users.id)
#
class RunUnitSubmission < ApplicationRecord
  belongs_to :run_submission
  belongs_to :user
  belongs_to :run
  belongs_to :run_unit

  validates :progress, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}

  before_save :update_passing

  def update_passing
    self.passing = progress >= run_unit.passing_progress
  end
end
