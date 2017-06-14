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

ActiveRecord::Schema.define(version: 20170613022316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bronzes", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_bronzes_on_location_id"
    t.index ["user_id"], name: "index_bronzes_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "thumbnail"
    t.string "big_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_comments_on_location_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "medal"
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_favorites_on_location_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "golds", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_golds_on_location_id"
    t.index ["user_id"], name: "index_golds_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "img_url"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_items_on_city_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "img_url"
    t.integer "gold"
    t.integer "silver"
    t.integer "bronze"
    t.integer "total_score"
    t.integer "total_votes"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_locations_on_item_id"
  end

  create_table "silvers", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_silvers_on_location_id"
    t.index ["user_id"], name: "index_silvers_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_tags_on_item_id"
    t.index ["location_id"], name: "index_tags_on_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bronzes", "locations"
  add_foreign_key "bronzes", "users"
  add_foreign_key "comments", "locations"
  add_foreign_key "favorites", "locations"
  add_foreign_key "favorites", "users"
  add_foreign_key "golds", "locations"
  add_foreign_key "golds", "users"
  add_foreign_key "items", "cities"
  add_foreign_key "locations", "items"
  add_foreign_key "silvers", "locations"
  add_foreign_key "silvers", "users"
  add_foreign_key "tags", "items"
  add_foreign_key "tags", "locations"
end
