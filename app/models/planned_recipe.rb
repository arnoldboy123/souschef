class PlannedRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :date, uniqueness: true, allow_nil: true
end
