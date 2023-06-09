# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_02_205406) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "house_number"
    t.string "society_name"
    t.string "area"
    t.string "city"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_addresses_on_employee_id"
  end

  create_table "custbooks", force: :cascade do |t|
    t.bigint "restaurant_id_id"
    t.datetime "booking_date_time"
    t.integer "number_of_diners", null: false
    t.boolean "accessible", default: false, null: false
    t.integer "highchair", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "status", null: false
    t.string "source", null: false
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurant_id"
    t.bigint "restaurants_id"
    t.datetime "cancelled_at"
    t.string "cancelled_by"
    t.index ["restaurant_id_id"], name: "index_custbooks_on_restaurant_id_id"
    t.index ["restaurants_id"], name: "index_custbooks_on_restaurants_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "employee_name"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "errorcodes", force: :cascade do |t|
    t.string "ref"
    t.string "msg"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exemptions", force: :cascade do |t|
    t.datetime "exempt_dat"
    t.string "exempt_msg"
    t.boolean "lunch"
    t.boolean "dinner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.integer "day", null: false
    t.boolean "open", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id", null: false
    t.index ["restaurant_id"], name: "index_opening_hours_on_restaurant_id"
  end

  create_table "rdetails", force: :cascade do |t|
    t.integer "restaurant_id", default: 0, null: false
    t.integer "booking_duration"
    t.integer "min_booking", default: 0, null: false
    t.integer "max_booking", default: 0, null: false
    t.time "last_booking_time"
    t.integer "big_table_count", default: 0, null: false
    t.integer "max_diners_at_current_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "restaurant_id"
    t.datetime "booking_date_time", null: false
    t.integer "number_of_diners", null: false
    t.boolean "accessible", default: false
    t.integer "highchair", default: 0
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "status"
    t.string "source"
    t.datetime "cancelled_at"
    t.integer "cancelled_by"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurants_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
    t.index ["restaurants_id"], name: "index_reservations_on_restaurants_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "account_id", default: 0, null: false
    t.string "name", default: "f", null: false
    t.string "location"
    t.string "website"
    t.string "primary_contact"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sattings", force: :cascade do |t|
    t.time "start_time"
    t.string "end_time"
    t.bigint "opening_hour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opening_hour_id"], name: "index_sattings_on_opening_hour_id"
  end

  create_table "sittings", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.bigint "opening_hour_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opening_hour_id"], name: "index_sittings_on_opening_hour_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "custbooks", "restaurants"
  add_foreign_key "opening_hours", "restaurants"
  add_foreign_key "reservations", "restaurants"
  add_foreign_key "sattings", "opening_hours"
  add_foreign_key "sittings", "opening_hours"
end
