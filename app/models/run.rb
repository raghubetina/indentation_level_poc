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
  has_many :run_units, dependent: :destroy
end
