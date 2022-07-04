class CreateJoinTablePriceShop < ActiveRecord::Migration[7.0]
  def change
    create_join_table :prices, :shops do |t|
      # t.index [:price_id, :shop_id]
      # t.index [:shop_id, :price_id]
    end
  end
end
