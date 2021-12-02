class Ingredient < ApplicationRecord
  validates :name, uniqueness: true
  include PgSearch::Model
  pg_search_scope :search_ingredients,
    against: %i[name category],
    using: {
      tsearch: { prefix: true }
  }

end
