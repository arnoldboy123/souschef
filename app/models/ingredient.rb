class Ingredient < ApplicationRecord
  belongs_to :fridge_item
  belongs_to :recipe_item

  validates :name, presence: true, length: { minimum: 2 }
  validates :unit, presence: true
  validates :calories, presence: true
  validates :price, presence: true
  validates :category, presence: true
end
