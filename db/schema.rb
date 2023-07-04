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

ActiveRecord::Schema[7.0].define(version: 2023_07_04_130039) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "item_code"
    t.string "decor_code"
    t.string "item_name"
    t.text "item_description"
    t.string "image"
    t.string "dimensions"
    t.string "article_group"
    t.string "tax_class"
    t.string "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "base_unit_id"
    t.bigint "target_unit_id"
    t.index ["base_unit_id"], name: "index_items_on_base_unit_id"
    t.index ["target_unit_id"], name: "index_items_on_target_unit_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.integer "price_in_euro"
    t.integer "old_purchase_price"
    t.date "valid_from_old_purchase"
    t.integer "new_purchase_price"
    t.date "valid_from_new_purchase"
    t.date "valid_to_new_purchase"
    t.integer "old_retail_price"
    t.integer "new_retail_price"
    t.date "new_retail_price_valid_from"
    t.date "new_retail_price_valid_to"
    t.integer "change_in_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "currency_id"
    t.index ["currency_id"], name: "index_pricings_on_currency_id"
  end

  create_table "unit_of_measures", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "unit_of_measures", column: "base_unit_id"
  add_foreign_key "items", "unit_of_measures", column: "target_unit_id"
  add_foreign_key "pricings", "currencies"
end
