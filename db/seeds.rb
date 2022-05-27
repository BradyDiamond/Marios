# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
db/seeds.rb
Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.spice,
                        cost: Faker::Lorem.number(20, false, 0).chop,
                        country_of_origin: "USA")
                        250.times do |index|
                          Product.create!(name: Faker::Food.spice,
                        cost: Faker::Lorem.sentence(20, false, 0).chop,
                        country_of_origin: "USA")
end


p "Created #{Spice.count} spices"