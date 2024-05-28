class AddPositionToRunUnits < ActiveRecord::Migration[7.1]
  def change
    add_column :run_units, :position, :integer, null: false

    add_index :run_units, [:run_id, :position], unique: true
  end
end
