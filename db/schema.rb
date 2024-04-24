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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_130634) do
  create_table "reservations", force: :cascade do |t|
    t.integer "num_billet"
    t.integer "num_reserv"
    t.datetime "date"
    t.time "hour"
    t.integer "show_key"
    t.string "show"
    t.integer "represent_key"
    t.string "represent"
    t.date "represent_date"
    t.time "represent_hour"
    t.date "represent_end_date"
    t.time "represent_end_hour"
    t.decimal "price", precision: 8, scale: 2
    t.string "product_type"
    t.string "sales_channel"
    t.string "lastname"
    t.string "firstname"
    t.string "email"
    t.string "adress"
    t.integer "pcode"
    t.string "country"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
