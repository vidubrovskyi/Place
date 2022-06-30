class CreatePts < ActiveRecord::Migration[7.0]
  def change
    create_table :pts do |t|
      t.string :pt

      t.timestamps
    end
  end
end
