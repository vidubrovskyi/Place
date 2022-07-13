class Pt < ApplicationRecord

  has_and_belongs_to_many :shops, dependent: :destroy

  validates :pt, presence: true, length: {maximum: 50}

end
