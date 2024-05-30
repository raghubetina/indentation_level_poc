# == Schema Information
#
# Table name: run_submissions
#
#  id         :bigint           not null, primary key
#  progress   :float            default(0.0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  run_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_run_submissions_on_run_id   (run_id)
#  index_run_submissions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (run_id => runs.id)
#  fk_rails_...  (user_id => users.id)
#
class RunSubmission < ApplicationRecord
  belongs_to :run
  belongs_to :user
  has_many :run_unit_submissions, dependent: :destroy
end
