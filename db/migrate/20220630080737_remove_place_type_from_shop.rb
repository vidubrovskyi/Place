class RemovePlaceTypeFromShop < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :place_type, :string
  end
end
