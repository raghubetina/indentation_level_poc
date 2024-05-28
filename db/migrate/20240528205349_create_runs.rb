class CreateRuns < ActiveRecord::Migration[7.1]
  def change
    create_table :runs do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
