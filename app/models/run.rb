# == Schema Information
#
# Table name: runs
#
#  id          :bigint           not null, primary key
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Run < ApplicationRecord
  has_many :run_submissions, dependent: :destroy
  has_many :run_unit_submissions, dependent: :destroy
  has_many :run_units, dependent: :destroy

  has_many :users, through: :run_submissions, source: :user

  def weight_total_of_children
    run_units.sum(:weight)
  end

  def enroll_user(user)
    run_submission = run_submissions.create(user: user)

    run_units.each do |run_unit|
      run_unit.run_unit_submissions.create!(
        user:,
        run_submission:,
        run: self
      )
    end
  end
end
