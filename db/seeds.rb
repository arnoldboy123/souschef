# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroy all recipes"
Recipe.destroy_all
puts "killing current users"
User.destroy_all

puts "adding admin"
user = User.new(email: 'souschef@gmail.com', username: 'admin', password: '123456')
user.save!
puts "email: souschef@gmail.com, password: 123456"

puts "removing ingredients..."
Ingredient.destroy_all

puts "adding ingredients..."
300.times do
  @ingredient = Ingredient.new(name: Faker::Food.unique.ingredient)
  puts @ingredient.name
  @ingredient.save!
end
puts "Done"

FridgeItem.destroy_all

puts "stocking your fridge..."
item = FridgeItem.new
item.ingredient_id = Ingredient.last.id
item.user_id = User.last.id
item.save!

item = FridgeItem.new
item.ingredient_id = Ingredient.first.id
item.user_id = User.last.id
item.save!

puts "adding some recipes"
50.times do
  @recipe = Recipe.new(
    name: Faker::Food.unique.dish,
    creator: User.first,
    instructions: Faker::Lorem.sentence,
    cooking_time: Faker::Number.number(digits: 2)
  )
  puts @recipe.name
  @recipe.save!
end
puts "Enjoy!"
