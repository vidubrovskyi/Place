class CreateJoinTableBenefitShop < ActiveRecord::Migration[7.0]
  def change
    create_join_table :benefits, :shops do |t|
      # t.index [:benefit_id, :shop_id]
      # t.index [:shop_id, :benefit_id]
    end
  end
end
