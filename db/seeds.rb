# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying database..."
Flat.destroy_all
Review.destroy_all

10.times do
  flat = Flat.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    price_per_night: rand(20..50),
    number_of_guests: rand(1..5)
  )

  10.times do
    Review.create(
      content: Faker::Restaurant.review,
      rating: rand(1..5)
    )
  end


end



puts "Done!"

