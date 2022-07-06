class CreateJoinTableShopHit < ActiveRecord::Migration[7.0]
  def change
    create_join_table :shops, :hits do |t|
      # t.index [:shop_id, :hit_id]
      # t.index [:hit_id, :shop_id]
    end
  end
end
