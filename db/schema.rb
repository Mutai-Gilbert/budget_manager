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

ActiveRecord::Schema[7.0].define(version: 2023_07_15_052957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "icon", default: "", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "categories_transaction_entries", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "transaction_entry_id", null: false
    t.index ["category_id"], name: "index_categories_transaction_entries_on_category_id"
    t.index ["transaction_entry_id"], name: "index_categories_transaction_entries_on_transaction_entry_id"
  end

  create_table "categories_transactions", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "transaction_id", null: false
  end

  create_table "transaction_entries", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transaction_entries_on_user_id"
  end

  create_table "transactions_entries", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.decimal "amount", default: "0.0"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "categories_transaction_entries", "categories"
  add_foreign_key "categories_transaction_entries", "transaction_entries"
  add_foreign_key "transaction_entries", "users"
  add_foreign_key "transactions_entries", "users"
end
