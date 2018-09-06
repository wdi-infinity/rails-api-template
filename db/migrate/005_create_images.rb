class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :url, null: false, index: { unique: true }
      t.references :photographer, index: true, foreign_key: true, null: false
      t.boolean :rejected, default: false
      t.text :note

      t.timestamps
    end
  end
end
