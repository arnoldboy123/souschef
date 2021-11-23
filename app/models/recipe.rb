class Recipe < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :recipe_items
  has_many :ingredients, through: :recipe_items
end
