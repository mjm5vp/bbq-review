class Location < ApplicationRecord
  validates :name, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :item
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
