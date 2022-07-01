module ShopsHelper
  def downvote_label(shop, user)
    label_text = if user.voted_down_on? shop
                   "UNvote"
                 else
                   "DOWNvote"
                 end
    tag.span do
      "#{shop.cached_votes_down}#{label_text}"
    end
  end

  def downvote_label_styles(shop, user)
    if user.voted_down_on? shop
      "background-color: red"
    end
  end

  def upvote_label(shop, user)
    label_text = if user.voted_up_on? shop
                   "UNvote"
                 else
                   "UPvote"
                 end
    tag.span do
      "#{shop.cached_votes_up}#{label_text}"
    end
  end

  def upvote_label_styles(shop, user)
    if user.voted_up_on? shop
      "background-color: green"
    end
  end
end
