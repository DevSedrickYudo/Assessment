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

ActiveRecord::Schema[7.0].define(version: 2025_01_13_023745) do
  create_table "addresses", force: :cascade do |t|
    t.string "addressid", limit: 120
    t.string "address", limit: 250
    t.string "address2", limit: 250
    t.string "city", limit: 150
    t.string "state", limit: 80
    t.string "zip", limit: 30
    t.string "county", limit: 30
    t.string "lat", limit: 40
    t.string "lon", limit: 40
    t.json "address_hash"
    t.text "notes"
    t.integer "deleted_id", default: 0, null: false
    t.datetime "created_at"
    t.integer "created_by_id", default: 0, null: false
    t.datetime "updated_at"
    t.integer "updated_by_id", default: 0, null: false
    t.text "update_info"
  end

end
