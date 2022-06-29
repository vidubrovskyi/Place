class RemoveBenefitsFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :benefits, :string, array: true, default:[]
  end
end
