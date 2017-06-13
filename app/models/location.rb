class Location < ApplicationRecord
  # belongs_to :item
  has_many :comments
  # has_many :tags
  # has_many :items, through: :tags
  belongs_to :item
  has_many :favorites
  has_many :users, through: :favorites
  # has_many :golds
  # has_many :silvers
  # has_many :bronzes
  # has_many :users, through: :golds
  # has_many :users, through: :silvers
  # has_many :users, through: :bronzes
end
