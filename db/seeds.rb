# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Review.destroy_all
Motorbike.destroy_all

puts "Creating reviews..."
review1 = { content: 'Great!', rating: '4' }
review2 = { content: 'Super!', rating: '5' }
review3 = { content: 'Top!', rating: '5' }
review4 = { content: 'Bad!', rating: '1' }
review5 = { content: 'Good enough!', rating: '3' }

[review1, review2, review3, review4, review5].each do |attributes|
  review = Review.create!(attributes)
  puts "Created #{review.content}"
end
puts "Finished"

puts "Creating motorbikes"
motorbike1 = { name: "1", brand: "Yamaha", color: "Black", year: "1991", price: "500 $" }
motorbike2 = { name: "2", brand: "Scoopy", color: "Red", year: "1992", price: "500 $" }
motorbike3 = { name: "3", brand: "Gtx", color: "Blue", year: "1993", price: "500 $" }
motorbike4 = { name: "4", brand: "Ninja", color: "White", year: "1994", price: "500 $" }
motorbike5 = { name: "5", brand: "Click", color: "Yellow", year: "1995", price: "500 $" }

[motorbike1, motorbike2, motorbike3, motorbike4, motorbike5].each do |attributes|
  motorbike = Motorbike.create!(attributes)
  puts "Created #{motorbike.name}"
end
puts "Finished !"

puts "Creating User"
user = { email_adress: "Compliqué@lewagon.com", password: "123456", name: "Bob" , age: "21"}
