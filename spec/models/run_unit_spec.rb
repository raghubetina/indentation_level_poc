# == Schema Information
#
# Table name: run_units
#
#  id                :bigint           not null, primary key
#  description       :string
#  indentation_level :integer          default(0)
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  run_id            :bigint           not null
#
# Indexes
#
#  index_run_units_on_run_id  (run_id)
#
# Foreign Keys
#
#  fk_rails_...  (run_id => runs.id)
#
require 'rails_helper'

RSpec.describe RunUnit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
