class CreateRunSubmissions < ActiveRecord::Migration[7.1]
  def change
    create_table :run_submissions do |t|
      t.belongs_to :run, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.float :progress, default: 0

      t.timestamps
    end
  end
end
