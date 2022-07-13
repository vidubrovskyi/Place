class Benefit < ApplicationRecord

  has_and_belongs_to_many :shops, dependent: :destroy

  validates :children, presence: true, length: {maximum: 50}

end
