class CreateAlbumImages < ActiveRecord::Migration[5.1]
  def change
    create_table :album_images do |t|
      t.references :album, index: true, foreign_key: true, null: false
      t.references :image, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end

