class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recipes, dependent: :destroy, foreign_key: :creator
  has_many :fridge_items, dependent: :destroy
  has_many :friend_requests, dependent: :destroy, foreign_key: :requester
  has_many :users, through: :friend_requests

  has_one_attached :photo
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_email,
    against: [ :email ],
    using: {
      tsearch: { prefix: true }
    }
end
