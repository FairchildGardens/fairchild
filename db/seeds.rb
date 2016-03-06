# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

plants = Plant.first(50)

plants.each do |plant|
  puts 'calling wiki'
  wiki = Task.search_wikipedia(plant.botanical_name)

  puts "Wiki success: #{wiki}"
  if wiki[:success]
    puts "Plant Name: #{plant.botanical_name}"
    task = Task.where(name: plant.botanical_name.titlecase)

    if task.blank?
      Task.create(name: plant.botanical_name.titlecase, description: wiki[:excerpt], image: wiki[:image])
    end

  end
end

# Hunt.create(
#   name: "#{plant.botanical_name}",
#   image: 'http://i.imgur.com/CveMZTU.jpg'
# )
# # plants.each do |plant|
#   # Hunt.create(
#   #   name: "Hunt #{i}",
#   #   image: 'http://i.imgur.com/CveMZTU.jpg'
#   # )
# # end

# top_left_lat = 25.67765643085977 
# top_left_lng = -80.27585506439209
# bottom_right_lat = 25.675645195059282 
# bottom_right_lng = -80.2686882019043

# task_images = [
#   'http://greenforks.com/asset/greenforks/2009/06/Wild-flowers-04.jpg',
#   'http://www.flowerspictures.org/image/flowers/wild-bergamot/thumbs/wild-bergamot-flower.jpg',
#   'http://healthyhomegardening.com/images/gardengeek/wildflower_858.jpg',
#   'http://3.bp.blogspot.com/-tfR52fDRQuM/TuBtCqxNWYI/AAAAAAAAAFk/UlmuoF9eL50/s1600/Wild-Flower.jpg',
#   'http://www.pd4pic.com/images/yellow-wild-flower-nature-summer-flowers-bloom.jpg',
#   'https://s-media-cache-ak0.pinimg.com/736x/e0/b2/67/e0b2673d5ee0be98e9e346f8d7a2fd07.jpg',
#   'http://www.walltor.com/images/wallpaper/wild--ranunculus-flowers---wallpaper-102722.jpg',
#   'http://urbanbutterflygarden.co.uk/wp-content/uploads/2012/09/wild-strawberry-in-Flower.jpg',
#   'http://www.designzzz.com/wp-content/uploads/2012/06/RwWild-flower.jpg',
#   'http://images.fineartamerica.com/images-medium-large/wild-carnation-flower-sami-sarkis.jpg'
# ];

# hunt = Hunt.first
# 10.times.each do |i|
  
#   final_lat = rand(bottom_right_lat..top_left_lat)
#   final_lng = rand(top_left_lng..bottom_right_lng)

#   Task.create(
#     name: "Task #{i}",
#     geo: "#{final_lat},#{final_lng}",
#     hunt_id: hunt.id,
#     image: task_images[i]
#   )

# end