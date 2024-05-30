class AddPassingProgressToRunUnits < ActiveRecord::Migration[7.1]
  def change
    add_column :run_units, :passing_progress, :float, default: 1
  end
end
