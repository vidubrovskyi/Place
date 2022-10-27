class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter

  has_one_attached :avatar

  has_many :shops
  has_many :reviews

end
