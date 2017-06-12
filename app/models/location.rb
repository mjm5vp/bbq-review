class Location < ApplicationRecord
  # belongs_to :item
  has_many :comments
  has_many :tags
  has_many :items, through: :tags
end
