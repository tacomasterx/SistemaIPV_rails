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

ActiveRecord::Schema[7.0].define(version: 2022_04_16_011340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "last_name_1"
    t.string "last_name_2"
    t.string "rfc"
    t.string "address"
    t.integer "phone_home"
    t.integer "phone_mobile"
    t.string "charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id", default: 1, null: false
    t.index ["shop_id"], name: "index_employees_on_shop_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.float "original_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shop_id", null: false
    t.bigint "product_id", null: false
    t.bigint "product_status_id", null: false
    t.bigint "employee_id", null: false
    t.index ["employee_id"], name: "index_inventory_items_on_employee_id"
    t.index ["product_id"], name: "index_inventory_items_on_product_id"
    t.index ["product_status_id"], name: "index_inventory_items_on_product_status_id"
    t.index ["shop_id"], name: "index_inventory_items_on_shop_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.float "payment"
    t.integer "sale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_payment_details_on_sale_id"
  end

  create_table "product_statuses", force: :cascade do |t|
    t.string "name"
    t.integer "managable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "unit"
    t.float "quantity"
    t.float "weight"
    t.float "price_unit"
    t.integer "profit"
    t.float "price_2"
    t.float "price_3"
    t.float "price_4"
    t.float "price_5"
    t.string "brand"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_type_id", null: false
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "sale_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.bigint "sale_id", null: false
    t.index ["employee_id"], name: "index_sale_sessions_on_employee_id"
    t.index ["sale_id"], name: "index_sale_sessions_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.float "amount"
    t.float "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", null: false
    t.bigint "shop_id", null: false
    t.index ["employee_id"], name: "index_sales_on_employee_id"
    t.index ["shop_id"], name: "index_sales_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "pseudonym"
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_id", null: false
    t.bigint "inventory_item_id", null: false
    t.index ["inventory_item_id"], name: "index_transactions_on_inventory_item_id"
    t.index ["sale_id"], name: "index_transactions_on_sale_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id", default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["employee_id"], name: "index_users_on_employee_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employees", "shops"
  add_foreign_key "inventory_items", "employees"
  add_foreign_key "inventory_items", "product_statuses"
  add_foreign_key "inventory_items", "products"
  add_foreign_key "inventory_items", "shops"
  add_foreign_key "payment_details", "sales"
  add_foreign_key "products", "product_types"
  add_foreign_key "sale_sessions", "employees"
  add_foreign_key "sale_sessions", "sales"
  add_foreign_key "sales", "employees"
  add_foreign_key "sales", "shops"
  add_foreign_key "transactions", "inventory_items"
  add_foreign_key "transactions", "sales"
  add_foreign_key "users", "employees"
end
