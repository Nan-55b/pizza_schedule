class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :schedule, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
