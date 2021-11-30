class Post < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :comments
end
