class Recipe < ApplicationRecord
  belongs_to :creator, class_name: 'User'
end
