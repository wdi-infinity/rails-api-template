class CreateUserTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_types do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps null: false
    end
  end
end
