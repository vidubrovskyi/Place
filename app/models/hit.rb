class Hit < ApplicationRecord

  has_one_attached :avatar

  has_and_belongs_to_many :shops


  validates :title, presence: true, length: {maximum: 120}
  validates :body, presence: true, length: {maximum: 1000}

  default_scope -> { order(created_at: :desc) }

end
