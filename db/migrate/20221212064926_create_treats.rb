class CreateTreats < ActiveRecord::Migration[5.2]
  def change
    create_table :treats do |t|
      t.string :user, limit: 30, null: false
      t.string :event, limit: 30, null: false
      t.integer :tired_level, null: false
      t.string :reward_name
      t.string :reward_category, limit: 30, null: false

      t.timestamps
    end
  end
end
