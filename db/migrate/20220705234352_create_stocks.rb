class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
