# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

hunts = []
6.times  do |i|
  hunt = Hunt.create(
    name: "Hunt #{i}",
    image: 'http://i.imgur.com/CveMZTU.jpg'
  )
  hunts << hunt
end

plants = Plant.all

hunts.each do |hunt|
  plant_count = 0
  plants.each do |plant|
    if plant_count < 10
      puts 'calling wiki'
      task = Task.where(name: plant.botanical_name.titlecase)

      if task.blank?
        wiki = Task.search_wikipedia(plant.botanical_name)

        puts "Wiki success: #{wiki}"
        if wiki[:success]
          puts "Plant Name: #{plant.botanical_name}"

          Task.create(name: plant.botanical_name.titlecase, description: wiki[:excerpt], image: wiki[:image], hunt_id: hunt.id)
          plant_count += 1

        end
      end

    end
  end
end