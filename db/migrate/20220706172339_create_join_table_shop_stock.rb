class CreateJoinTableShopStock < ActiveRecord::Migration[7.0]
  def change
    create_join_table :shops, :stocks do |t|
      # t.index [:shop_id, :stock_id]
      # t.index [:stock_id, :shop_id]
    end
  end
end
