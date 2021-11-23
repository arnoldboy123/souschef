# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "removing ingredients..."

Ingredient.destroy_all

puts "adding ingredients..."

300.times do
  @ingredient = Ingredient.new(name: Faker::Food.unique.ingredient)
  puts @ingredient.name
  @ingredient.save!
end

puts "Done"
