class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
