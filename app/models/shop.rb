class Shop < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :benefits
  has_and_belongs_to_many :pts

  has_many_attached :images

  PLACETYPE = ["Lounge-бари", "Гриль-бари", "Дитячі заклади", "Кальян-бари",
               "Кафе", "Паби, бари", "Піцерії", "Ресторани", "Спорт-бари",
               "Суші-бари", "Фаст-фуди" ]

  validates :place_type, inclusion: {in: Shop::PLACETYPE}

end
