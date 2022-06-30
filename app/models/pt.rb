class Pt < ApplicationRecord

  has_and_belongs_to_many :shops, dependent: :destroy

end
