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

ActiveRecord::Schema[7.1].define(version: 2024_08_02_171851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appreciation_values", force: :cascade do |t|
    t.decimal "latest_quarter"
    t.decimal "last_12months"
    t.decimal "last_2years"
    t.decimal "last_5years"
    t.decimal "last_10years"
    t.decimal "since_2000"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.string "state"
    t.decimal "longitude"
    t.decimal "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crime_rates", force: :cascade do |t|
    t.integer "city_id"
    t.decimal "crime_index"
    t.decimal "violent_crime_rate"
    t.decimal "property_crime_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groceries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grocery_cities", force: :cascade do |t|
    t.integer "city_id"
    t.integer "grocery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metras", force: :cascade do |t|
    t.string "station"
    t.string "lines"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer "median_home_value"
    t.integer "rental_value"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "city_id"
    t.text "pros"
    t.text "cons"
    t.text "recommend_family_type"
    t.integer "ratings"
    t.integer "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_grades", force: :cascade do |t|
    t.integer "city_id"
    t.integer "score_compared_to_us"
    t.integer "score_compared_to_il"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.text "user_family_type", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "saved_cities", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
