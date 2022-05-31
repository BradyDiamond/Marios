# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
Product.destroy_all
Review.destroy_all

50.times do |index|
  Product.create!(name: Faker::Coffee.blend_name,
                  cost: Faker::Number.within(range: 1..500),
                  country_of_origin: ("USA"),
                  id: Faker::Number.unique.within(range: 1..50))
  #                   5.times do
  #                     Review.create!(author: Faker::Name.name,
  #                     rating: Faker::Number.within(range: 1..5),
  #                     content_body: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false))                  
  # end      
end
250.times do
                      Review.create!(author: Faker::Name.name,
                      product_id: Faker::Number.within(range: 1..50),
                      rating: Faker::Number.within(range: 1..5),
                      content_body: Faker::Lorem.paragraph_by_chars(number: 50, supplemental: false))                  
end      

p "Created #{Product.count} coffees"