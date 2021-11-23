class Ingredient < ApplicationRecord
  belongs_to :fridge_item
  belongs_to :recipe_item
end
