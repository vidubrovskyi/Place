module ShopsHelper

  def filter(uno)
    case
    when uno == "bar"

      @shops.where(place_type: "bar").each do |shop|
        shop.name
      end
      when uno == "pizza"
        @shops.where(place_type: "pizza").each do |shop|
          shop.name
        end
      else
        @shops.each do |shop|
          shop.name
        end
    end
  end
end
