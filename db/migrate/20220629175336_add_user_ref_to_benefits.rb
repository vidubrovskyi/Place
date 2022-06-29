class AddUserRefToBenefits < ActiveRecord::Migration[7.0]
  def change
    add_reference :benefits, :user, foreign_key: true
  end
end
