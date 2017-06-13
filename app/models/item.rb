class Item < ApplicationRecord
  belongs_to :city
  # has_many :locations
  # has_many :tags
  # has_many :locations, through: :tags
  has_many :locations
end
