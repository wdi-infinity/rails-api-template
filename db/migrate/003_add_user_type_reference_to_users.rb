class AddUserTypeReferenceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :user_types, index: true, foreign_key: true, null: false
  end
end
