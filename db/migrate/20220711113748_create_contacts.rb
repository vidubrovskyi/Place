class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :contact
      t.string :body
      t.string :email

      t.timestamps
    end
  end
end
