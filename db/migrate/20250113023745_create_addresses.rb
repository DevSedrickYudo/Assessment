class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table "addresses", id: :integer, force: :cascade do |t|
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
end
