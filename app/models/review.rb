class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop


  validates :message, presence: true, length: {maximum: 200}

end
