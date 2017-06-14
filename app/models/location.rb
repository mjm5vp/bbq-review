class Location < ApplicationRecord
  validates :name, presence: true

  has_many :comments
  belongs_to :item
  has_many :favorites
  has_many :users, through: :favorites
end
