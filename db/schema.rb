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

ActiveRecord::Schema.define(version: 20171124121459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", id: :serial, force: :cascade do |t|
    t.string "attachinariable_type"
    t.integer "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "office_id"
    t.date "date_from"
    t.date "date_to"
    t.integer "number_people"
    t.boolean "accepting", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_bookings_on_office_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "office_id"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_messages_on_office_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offices", force: :cascade do |t|
    t.bigint "user_id"
    t.string "size"
    t.string "address"
    t.boolean "availability", default: true
    t.string "city"
    t.string "office_type"
    t.integer "price_per_hour"
    t.integer "price_per_day"
    t.integer "price_per_week"
    t.integer "price_per_month"
    t.text "description"
    t.string "facility_standard"
    t.string "pictures"
    t.date "available_from"
    t.date "available_to"
    t.string "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.string "period"
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.index ["user_id"], name: "index_offices_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "booking_id"
    t.integer "rating"
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "provider"
    t.string "user_name"
    t.string "job_field"
    t.string "first_name"
    t.string "last_name"
    t.string "birthday"
    t.string "address"
    t.string "phone"
    t.string "language"
    t.string "currency"
    t.string "personal_description"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "offices"
  add_foreign_key "bookings", "users"
  add_foreign_key "messages", "offices"
  add_foreign_key "messages", "users"
  add_foreign_key "offices", "users"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users"
end
