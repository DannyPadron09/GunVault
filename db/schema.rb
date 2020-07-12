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

ActiveRecord::Schema.define(version: 2020_07_12_174005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ammunitions", primary_key: "ammunition_id", force: :cascade do |t|
    t.string "caliber"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
  end

  create_table "guns", primary_key: "gun_id", force: :cascade do |t|
    t.string "gun_name"
    t.string "caliber"
    t.integer "owner_id"
    t.integer "ammunition_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "owners", primary_key: "owners_id", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "favorite_gun"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

end
