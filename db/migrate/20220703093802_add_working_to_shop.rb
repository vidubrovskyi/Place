class AddWorkingToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :working, :string
  end
end
