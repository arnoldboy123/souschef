class Recipe < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :recipe_items, :planned_recipes, :reviews
  has_many :ingredients, through: :recipe_items
  
  validates :creator, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :cooking_time, presence: true, numerically: { only_integer: true }
end
