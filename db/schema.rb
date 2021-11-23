# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_22_180900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.string "content"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

=======
>>>>>>> 3331ba75f46248b485a6ad8407cb4d017109e074
  create_table "fridge_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ingredient_id", null: false
    t.date "expiry_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id"], name: "index_fridge_items_on_ingredient_id"
    t.index ["user_id"], name: "index_fridge_items_on_user_id"
  end

<<<<<<< HEAD
=======
  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "calories"
    t.float "price"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

>>>>>>> 3331ba75f46248b485a6ad8407cb4d017109e074
  create_table "friend_requests", force: :cascade do |t|
    t.boolean "approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "requester_id", null: false
    t.bigint "recipient_id", null: false
    t.index ["recipient_id"], name: "index_friend_requests_on_recipient_id"
    t.index ["requester_id"], name: "index_friend_requests_on_requester_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.integer "calories"
    t.float "price"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "dietary_requirements"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
=======
  add_foreign_key "fridge_items", "ingredients"
  add_foreign_key "fridge_items", "users"
  add_foreign_key "friend_requests", "users", column: "recipient_id"
  add_foreign_key "friend_requests", "users", column: "requester_id"
>>>>>>> 3331ba75f46248b485a6ad8407cb4d017109e074
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "fridge_items", "ingredients"
  add_foreign_key "fridge_items", "users"
  add_foreign_key "friend_requests", "users", column: "recipient_id"
  add_foreign_key "friend_requests", "users", column: "requester_id"
  add_foreign_key "posts", "users"
end
