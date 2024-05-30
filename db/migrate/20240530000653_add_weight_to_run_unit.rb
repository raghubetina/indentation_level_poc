class AddWeightToRunUnit < ActiveRecord::Migration[7.1]
  def change
    add_column :run_units, :weight, :integer, default: 5
  end
end
