class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id, null: false
      t.boolean :completed, default: false
      t.boolean :public, default: true
      t.date :goal_date, null: false

      t.timestamps null: false
    end

    add_index :goals, :user_id
  end
end
