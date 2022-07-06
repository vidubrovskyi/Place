class CreateHits < ActiveRecord::Migration[7.0]
  def change
    create_table :hits do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
