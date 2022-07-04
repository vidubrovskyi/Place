class Shop < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :benefits
  has_and_belongs_to_many :pts
  has_and_belongs_to_many :prices

  has_many_attached :images
  has_one_attached :avatar

  acts_as_votable

  def upvote!(user)
    if user.voted_up_on? self
      unvote_by user
    else
      upvote_by user
    end
  end

  def downvote!(user)
    if user.voted_down_on? self
      unvote_by user
    else
      downvote_by user
    end
  end
end
