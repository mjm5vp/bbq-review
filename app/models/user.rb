class User < ApplicationRecord
  # has_many :golds
  # has_many :silvers
  # has_many :bronzes
  # has_many :locations, through: :golds
  # has_many :locations, through: :silvers
  # has_many :locations, through: :bronzes
  has_many :favorites
  has_many :locations, through: :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
