class CreateJoinTablePtShop < ActiveRecord::Migration[7.0]
  def change
    create_join_table :pts, :shops do |t|
      # t.index [:pt_id, :shop_id]
      # t.index [:shop_id, :pt_id]
    end
  end
end
