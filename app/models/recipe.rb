class Recipe < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_one_attached :photo
  has_many :recipe_items, dependent: :destroy
  has_many :planned_recipes
  has_many :reviews
  has_many :ingredients, through: :recipe_items

  validates :creator, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :instructions, presence: true
  validates :cooking_time, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
