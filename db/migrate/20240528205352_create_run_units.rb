class CreateRunUnits < ActiveRecord::Migration[7.1]
  def change
    create_table :run_units do |t|
      t.string :title
      t.string :description
      t.integer :indentation_level, default: 0
      t.belongs_to :run, null: false, foreign_key: true

      t.timestamps
    end
  end
end
