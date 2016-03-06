class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :botanical_name
      t.string :family
      t.string :location_in_garden

      t.timestamps null: false
    end
  end
end
