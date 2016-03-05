class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :geo
      t.string :claim_type
      t.string :image
      t.string :draft
      t.integer :hunt_id

      t.timestamps null: false
    end
  end
end
