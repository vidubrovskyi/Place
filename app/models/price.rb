class Price < ApplicationRecord

  has_and_belongs_to_many :shops, dependent: :destroy

  validates :price, presence: true, length: {maximum: 50}


end
