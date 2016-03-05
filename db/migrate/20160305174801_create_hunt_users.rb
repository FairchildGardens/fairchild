class CreateHuntUsers < ActiveRecord::Migration
  def change
    create_table :hunt_users do |t|
      t.integer :user_id
      t.integer :hunt_id

      t.timestamps null: false
    end
  end
end
