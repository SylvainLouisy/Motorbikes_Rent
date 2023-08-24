# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'

puts "Cleaning database..."
User.destroy_all

puts "Creating User"
user1 = { email: "guillaume@gmail.com", password: "123456", name: "Guillaume", age: "21" }
user2 = { email: "martin@gmail.com", password: "123456", name: "Martin", age: "21" }
user3 = { email: "bob@gmail.com", password: "123456", name: "Bob", age: "21" }
user4 = { email: "paul@gmail.com", password: "123456", name: "Paul", age: "21" }

[user1, user2, user3, user4].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.name}"
end

puts "Creating motorbikes"
motorbike1 = Motorbike.create(name: "YZF-R1", brand: "Yamaha", color: "Black", year: "2023", price: "50", address: "92 Bd de Clichy, 75018 Paris", description: "If you're tired to live book this demon!")
motorbike2 = Motorbike.create(name: "Scoopy", brand: "Scoopy", color: "Red", year: "2018", price: "20", address: "1 Bd Montmartre, 75002 Paris",  description: "A confy way to move around in the city")
motorbike3 = Motorbike.create(name: "PCX", brand: "PCX", color: "Blue", year: "2017", price: "30", address: "7 Bd Montmartre, 75002 Paris",  description: "A way to remember your days in Thailand")
motorbike4 = Motorbike.create(name: "Ninja", brand: "Kawasaki", color: "White", year: "2020", price: "60", address: "34 Quai d'Austerlitz, 75013 Paris",  description: "Simply a beast, lazy drivers go away")
motorbike5 = Motorbike.create(name: "Click 125", brand: "Click", color: "Yellow", year: "2022", price: "25", address: "32 Quai d'Austerlitz, 75013 Paris",  description: "A basic style but still efficient")
motorbike6 = Motorbike.create(name: "ADV 350", brand: "Honda", color: "Black", year: "2016", price: "40", address: "4 Quai d'Austerlitz, 75013 Paris",  description: "A new generation, just give it a try")
motorbike7 = Motorbike.create(name: "Piaggio", brand: "Piaggio", color: "White", year: "2018", price: "30", address: "92 Bd de Clichy, 75018 Paris",  description: "Italians do know how to make motorbikes!")
motorbike8 = Motorbike.create(name: "Burgman", brand: "Suzuki", color: "White", year: "2021", price: "25", address: "2 Bd de Clichy, 75018 Paris",  description: "I know I don't look very pretty but please pick me")
motorbike9 = Motorbike.create(name: "Primavera", brand: "Vespa", color: "Blue", year: "2015", price: "20", address: "92 Bd de Clichy, 75018 Paris",  description: "Old but classy, any ancester in the place ?")
motorbike10 = Motorbike.create(name: "Savy", brand: "BMW", color: "Black", year: "2022", price: "50", address: "8 Rue Saint-Denis, 75001 Paris",  description: "From Germany, say less, peoples know!")

file1 = URI.open("https://cdp.azureedge.net/products/USA/YA/2023/MC/SUPERSPORT/YZF-R1/50/PERFORMANCE_BLACK/2000000024.jpg")
file2 = URI.open("https://imgcdn.zigwheels.co.th/large/gallery/color/90/1683/honda-scoopy-i-2018-color-580076.jpg")
file3 = URI.open("https://imotorbike.my/news/wp-content/uploads/2017/06/pcx_candy.jpg")
file4 = URI.open("https://cdn.dealerspike.com/imglib/v1/800x600/imglib/trimsdb/19361521-0-120005081.jpg")
file5 = URI.open("https://imgcdn.zigwheels.co.th/large/gallery/color/90/3279/honda-click125i-color-216534.jpg")
file6 = URI.open("https://honda.foliemericourt.fr/nas/commun/annonces//2121e860d0af70630049cff6ebdb6bf4c648007e/photo-annonce-honda-x-adv-350_619e0f6b11138544980942.jpeg")
file7 = URI.open("https://images.piaggio.com/piaggio/vehicles/nsu1000u03/nsu1bycu03/nsu1bycu03-01-s.png")
file8 = URI.open("https://cdn.cleanrider.com/uploads/2023/04/suzuki-e-burgman.jpg")
file9 = URI.open("https://www.tillot.com/1426-tm_large_default/scooter-vespa-primavera-50-cm3-tillot-beaune-dijon.jpg")
file10 = URI.open("https://groupesavy.fr/img/modeles-motorrad/r1250rs.jpeg")
# photos = [file1, file2, file3, file4, file5]


motorbike1.user = User.first
motorbike1.photo.attach(io: file1, filename: "#{motorbike1.name}.png", content_type: "image/png")
motorbike1.save!
puts "Created #{motorbike1.name}"

motorbike2.user = User.first
motorbike2.photo.attach(io: file2, filename: "#{motorbike2.name}.png", content_type: "image/png")
motorbike2.save!
puts "Created #{motorbike2.name}"

motorbike3.user = User.first
motorbike3.photo.attach(io: file3, filename: "#{motorbike3.name}.png", content_type: "image/png")
motorbike3.save!
puts "Created #{motorbike3.name}"

motorbike4.user = User.first
motorbike4.photo.attach(io: file4, filename: "#{motorbike4.name}.png", content_type: "image/png")
motorbike4.save!
puts "Created #{motorbike4.name}"

motorbike5.user = User.first
motorbike5.photo.attach(io: file5, filename: "#{motorbike5.name}.png", content_type: "image/png")
motorbike5.save!
puts "Created #{motorbike5.name}"

motorbike6.user = User.first
motorbike6.photo.attach(io: file6, filename: "#{motorbike6.name}.png", content_type: "image/png")
motorbike6.save!
puts "Created #{motorbike5.name}"

motorbike7.user = User.first
motorbike7.photo.attach(io: file7, filename: "#{motorbike7.name}.png", content_type: "image/png")
motorbike7.save!
puts "Created #{motorbike5.name}"

motorbike8.user = User.first
motorbike8.photo.attach(io: file8, filename: "#{motorbike8.name}.png", content_type: "image/png")
motorbike8.save!
puts "Created #{motorbike5.name}"

motorbike9.user = User.first
motorbike9.photo.attach(io: file9, filename: "#{motorbike9.name}.png", content_type: "image/png")
motorbike9.save!
puts "Created #{motorbike5.name}"

motorbike10.user = User.first
motorbike10.photo.attach(io: file10, filename: "#{motorbike10.name}.png", content_type: "image/png")
motorbike10.save!
puts "Created #{motorbike5.name}"

# [motorbike1, motorbike2, motorbike3, motorbike4, motorbike5].each do |attributes|
#   motorbike = Motorbike.new(attributes)
#   motorbike.user = User.first
#   motorbike.photo.attach(io: photos[0], filename: "nes.png", content_type: "image/png")
#   motorbike.save!
#   photos.drop(1)
#   puts "Created #{motorbike.name}"
# end
# puts "Finished !"

puts "Creating reviews..."
review1 = { content: 'Great!', rating: '4' }
review2 = { content: 'Super!', rating: '5' }
review3 = { content: 'Top!', rating: '5' }
review4 = { content: 'Bad!', rating: '1' }
review5 = { content: 'Good enough!', rating: '3' }

[review1, review2, review3, review4, review5].each do |attributes|
  review = Review.new(attributes)
  review.motorbike = Motorbike.first
  review.save!
  puts "Created #{review.content}"
end
puts "Finished"
