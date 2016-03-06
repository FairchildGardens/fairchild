require 'csv'

task :import_plant_data => :environment do
  CSV.foreach("plant_names.csv") do |row|
    begin
      common_name = row[0]
      botanical_name = row[1]
      family = row[2]
      location_in_garden = row[3]
      Plant.where(common_name: common_name, botanical_name: botanical_name, family: family, location_in_garden: location_in_garden).first_or_create
    rescue => e
      p "an error occurred: #{e}"
    end
  end
end