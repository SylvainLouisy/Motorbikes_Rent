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
Motorbike.destroy_all
Review.destroy_all

puts "Creating User"
user1 = { email: "guillaume@gmail.com", password: "123456", first_name: "Guillaume", last_name: "Tel", age: "21" }
user2 = { email: "martin@gmail.com", password: "123456", first_name: "Martin", last_name: "Jean", age: "21" }
user3 = { email: "bob@gmail.com", password: "123456", first_name: "Bob", last_name: "Legrand", age: "21" }
user4 = { email: "paul@gmail.com", password: "123456", first_name: "Paul", last_name: "Dufour", age: "21" }

[user1, user2, user3, user4].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.first_name}"
end

puts "Creating motorbikes"
motorbike1 = Motorbike.create(name: "T-MAX 560", brand: "Yamaha", color: "Black", year: "2023", price: "100", address: "92 Bd de Clichy, 75018 Paris", description: "If you're tired to live book this demon!")
motorbike2 = Motorbike.create(name: "Forza 350", brand: "Honda", color: "White", year: "2022", price: "55", address: "1 Bd Montmartre, 75002 Paris",  description: "Be careful with this one, not for beginners")
motorbike3 = Motorbike.create(name: "PCX 125", brand: "Honda", color: "Grey", year: "2017", price: "30", address: "7 Bd Montmartre, 75002 Paris",  description: "A way to remember your days in Thailand")
motorbike4 = Motorbike.create(name: "NMAX 125", brand: "Yamaha", color: "Blue", year: "2020", price: "60", address: "34 Quai d'Austerlitz, 75013 Paris",  description: "Powerful with a nice design")
motorbike5 = Motorbike.create(name: "Agility 50", brand: "Kymco", color: "Black", year: "2022", price: "20", address: "32 Quai d'Austerlitz, 75013 Paris",  description: "A basic style but still efficient")
motorbike6 = Motorbike.create(name: "Tracer 7", brand: "Yamaha", color: "Black/Blue", year: "2023", price: "40", address: "4 Quai d'Austerlitz, 75013 Paris",  description: "A new generation, just give it a try")
motorbike7 = Motorbike.create(name: "Liberty", brand: "Piaggio", color: "White", year: "2018", price: "30", address: "92 Bd de Clichy, 75018 Paris",  description: "Italians do know how to make motorbikes!")
motorbike8 = Motorbike.create(name: "MT-07", brand: "Yamaha", color: "Black", year: "2021", price: "25", address: "2 Bd de Clichy, 75018 Paris",  description: "Simply a beast, lazy drivers go away")
motorbike9 = Motorbike.create(name: "Zip 50", brand: "Piaggio", color: "Grey", year: "2018", price: "20", address: "92 Bd de Clichy, 75018 Paris",  description: "A confy way to move around in the city")
motorbike10 = Motorbike.create(name: "C1S", brand: "Yadea", color: "Grey", year: "2022", price: "25", address: "85 boulevard saint michel, 75005 Paris",  description: "Easy to drive for beginners")
motorbike11 = Motorbike.create(name: "C1S Pro", brand: "Yadea", color: "Blue", year: "2022", price: "50", address: "70 boulevard saint germain, 75005 Paris",  description: "A bit more powerful than father C1S")
motorbike12 = Motorbike.create(name: "Forza 125", brand: "Honda", color: "Black", year: "2022", price: "45", address: "70 boulevard saint michel, 75005 Paris",  description: "Smooth drivers be ready")

file1 = URI.open("https://bikeloc.fr/assets/images/TMAX_560_Yamaha_2023.webp")
file2 = URI.open("https://bikeloc.fr/assets/images/FORZA_Honda_350cc_.webp")
file3 = URI.open("https://bikeloc.fr/assets/images/PCX_Honda_125cc179181.webp")
file4 = URI.open("https://bikeloc.fr/assets/images/NMAX_Yamaha_125cc_2022.webp")
file5 = URI.open("https://bikeloc.fr/assets/images/AGILITY_Kymco_50cc973480.webp")
file6 = URI.open("https://bikeloc.fr/assets/images/TRACER_7_Yamaha_2023.webp")
file7 = URI.open("https://bikeloc.fr/assets/images/LIBERTY_Piaggio_50cc724931.webp")
file8 = URI.open("https://bikeloc.fr/assets/images/MT-07_Yamaha_700cc_2023.webp")
file9 = URI.open("https://bikeloc.fr/assets/images/Piaggio_Zip_50cc_.webp")
file10 = URI.open("https://bikeloc.fr/assets/images/Yadea_C1S_(%C3%A9lectrique)932658.webp")
file11 = URI.open("https://bikeloc.fr/assets/images/C1S_PRO_Yadea_125cc_256645.webp")
file12 = URI.open("https://bikeloc.fr/assets/images/FORZA_Honda_125cc.webp")

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
puts "Created #{motorbike6.name}"

motorbike7.user = User.first
motorbike7.photo.attach(io: file7, filename: "#{motorbike7.name}.png", content_type: "image/png")
motorbike7.save!
puts "Created #{motorbike7.name}"

motorbike8.user = User.first
motorbike8.photo.attach(io: file8, filename: "#{motorbike8.name}.png", content_type: "image/png")
motorbike8.save!
puts "Created #{motorbike8.name}"

motorbike9.user = User.first
motorbike9.photo.attach(io: file9, filename: "#{motorbike9.name}.png", content_type: "image/png")
motorbike9.save!
puts "Created #{motorbike9.name}"

motorbike10.user = User.first
motorbike10.photo.attach(io: file10, filename: "#{motorbike10.name}.png", content_type: "image/png")
motorbike10.save!
puts "Created #{motorbike10.name}"

motorbike11.user = User.first
motorbike11.photo.attach(io: file11, filename: "#{motorbike11.name}.png", content_type: "image/png")
motorbike11.save!
puts "Created #{motorbike11.name}"

motorbike12.user = User.first
motorbike12.photo.attach(io: file12, filename: "#{motorbike12.name}.png", content_type: "image/png")
motorbike12.save!
puts "Created #{motorbike12.name}"





puts "Creating reviews..."
review1 = Review.new(content: 'Great!', rating: '4' )
review2 = Review.new(content: 'Super!', rating: '5' )
review3 = Review.new(content: 'Top!', rating: '5' )
review4 = Review.new(content: 'Bad!', rating: '1' )
review5 = Review.new(content: 'Good enough!', rating: '3' )
review6 = Review.new(content: 'Amazing experience', rating: '5' )
review7 = Review.new(content: 'Perfect!', rating: '5' )
review8 = Review.new(content: 'Had a great time!', rating: '4' )
review9 = Review.new(content: 'Disappointing', rating: '2' )
review10 = Review.new(content: 'Good price', rating: '3' )
review11 = Review.new(content: 'Good company', rating: '4' )
review12 = Review.new(content: 'Employees are very nice', rating: '4' )

review1.user = User.first
review1.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review1.save!
puts "Created #{review1.content}"

review2.user = User.first
review2.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review2.save!
puts "Created #{review2.content}"

review3.user = User.first
review3.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review3.save!
puts "Created #{review3.content}"

review4.user = User.first
review4.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review4.save!
puts "Created #{review4.content}"

review5.user = User.first
review5.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review5.save!
puts "Created #{review5.content}"

review6.user = User.first
review6.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review6.save!
puts "Created #{review6.content}"

review7.user = User.first
review7.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review7.save!
puts "Created #{review7.content}"

review8.user = User.first
review8.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review8.save!
puts "Created #{review8.content}"

review9.user = User.first
review9.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review9.save!
puts "Created #{review9.content}"

review10.user = User.first
review10.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review10.save!
puts "Created #{review10.content}"

review11.user = User.first
review11.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review11.save!
puts "Created #{review11.content}"

review12.user = User.first
review12.motorbike = Motorbike.joins(:user).where.not(id: User.first).sample
review12.save!
puts "Created #{review12.content}"


# [review1, review2, review3, review4, review5].each do |attributes|
#   review = Review.new(attributes)
#   review.motorbike = Motorbike.first
#   review.save!
#   puts "Created #{review.content}"
# end
puts "Finished"
