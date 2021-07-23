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

ActiveRecord::Schema.define(version: 2021_06_18_054830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.index ["code"], name: "index_genders_on_code", unique: true
  end

  create_table "hero_powers", force: :cascade do |t|
    t.bigint "hero_id"
    t.bigint "power_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hero_id", "power_id"], name: "index_hero_powers_on_hero_id_and_power_id", unique: true
    t.index ["hero_id"], name: "index_hero_powers_on_hero_id"
    t.index ["power_id"], name: "index_hero_powers_on_power_id"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "real_name", limit: 200
    t.integer "height"
    t.integer "weight"
    t.date "birthday"
    t.bigint "gender_id"
    t.bigint "race_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "agency_id"
    t.index ["agency_id"], name: "index_heroes_on_agency_id"
    t.index ["gender_id"], name: "index_heroes_on_gender_id"
    t.index ["race_id"], name: "index_heroes_on_race_id"
  end

  create_table "powers", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.index ["code"], name: "index_powers_on_code", unique: true
  end

  create_table "races", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.index ["code"], name: "index_races_on_code", unique: true
  end

  add_foreign_key "hero_powers", "heroes"
  add_foreign_key "hero_powers", "powers"
  add_foreign_key "heroes", "agencies"
  add_foreign_key "heroes", "genders"
  add_foreign_key "heroes", "races"
end
