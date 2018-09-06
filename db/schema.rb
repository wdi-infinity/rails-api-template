# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 7) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_images", force: :cascade do |t|
    t.bigint "album_id", null: false
    t.bigint "image_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_album_images_on_album_id"
    t.index ["image_id"], name: "index_album_images_on_image_id"
  end

  create_table "albums", force: :cascade do |t|
    t.string "name", null: false
    t.text "information", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url", null: false
    t.bigint "photographer_id", null: false
    t.boolean "rejected", default: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photographer_id"], name: "index_images_on_photographer_id"
    t.index ["url"], name: "index_images_on_url", unique: true
  end

  create_table "photographers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_types_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.boolean "change_pw", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_types_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
    t.index ["user_types_id"], name: "index_users_on_user_types_id"
  end

  add_foreign_key "album_images", "albums"
  add_foreign_key "album_images", "images"
  add_foreign_key "albums", "users"
  add_foreign_key "images", "photographers"
  add_foreign_key "users", "user_types", column: "user_types_id"
end
