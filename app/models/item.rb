class Item < ApplicationRecord
  validates :name, :img_url, presence: true
  belongs_to :city
  has_many :locations
end
