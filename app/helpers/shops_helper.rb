module ShopsHelper
  def downvote_label(shop)
    label_text = "Dislike"

    tag.span do
      "#{shop.cached_votes_down} #{label_text}"
    end
  end

  def downvote_label_styles(shop, user)
    if user_signed_in? and user.voted_down_on? shop
      "background-color: red; color: white; border-radius: 12px; width: 80px"
    else
      "background-color: #e7e7e7; color: black; border-radius: 12px; width: 80px"
    end
  end

  def upvote_label(shop)
    label_text = "Like"
    tag.span do
      "#{shop.cached_votes_up} #{label_text}"
    end
  end

  def upvote_label_styles(shop, user)
    if user_signed_in? and user.voted_up_on? shop
      "background-color: #4CAF50; color: white; border-radius: 12px; width: 80px"
    else
      "background-color: #e7e7e7; color: black; border-radius: 12px; width: 80px"
    end
  end
end
