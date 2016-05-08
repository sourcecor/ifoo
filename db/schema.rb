# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160508184450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "authentication_providers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authentication_providers", ["name"], name: "index_name_on_authentication_providers", using: :btree

  create_table "categories", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "caption"
    t.string   "description"
    t.integer  "seq"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "caption_s"
    t.string   "caption_e"
  end

  create_table "category_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_products", ["category_id"], name: "index_category_products_on_category_id", using: :btree
  add_index "category_products", ["product_id"], name: "index_category_products_on_product_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "form_numbers", force: :cascade do |t|
    t.string   "trsType",    limit: 2
    t.string   "yymm",       limit: 6
    t.integer  "seq"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "group_menus", id: false, force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_menus", ["group_id"], name: "index_group_menus_on_group_id", using: :btree
  add_index "group_menus", ["menu_id"], name: "index_group_menus_on_menu_id", using: :btree

  create_table "group_users", id: false, force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "caption"
    t.string   "action"
    t.integer  "seq"
    t.string   "position"
    t.integer  "removable"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "parent_id_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "qty"
    t.decimal  "price",      precision: 8, scale: 2
    t.integer  "product_id"
    t.string   "color"
    t.string   "size"
    t.string   "itemcode"
    t.string   "itemname"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "order_logs", force: :cascade do |t|
    t.string   "username"
    t.string   "aasm_state"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total_amount",                precision: 10, scale: 2
    t.integer  "qty_amount"
    t.string   "shipping_name"
    t.string   "shipping_phone"
    t.string   "shipping_zipcode"
    t.string   "shipping_address"
    t.string   "status"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "aasm_state"
    t.string   "trsNo",            limit: 12
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image"
    t.integer  "seq"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pictures", ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree

  create_table "product_main_pictures", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.integer  "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_profile_pictures", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.integer  "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "caption"
    t.text     "description"
    t.decimal  "unit_price",    precision: 8, scale: 2
    t.decimal  "sale_price",    precision: 8, scale: 2
    t.decimal  "cost",          precision: 8, scale: 2
    t.string   "itemcode"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "caption_s"
    t.text     "description_s"
    t.decimal  "unit_price_s",  precision: 8, scale: 2
    t.decimal  "sale_price_s",  precision: 8, scale: 2
    t.string   "caption_e"
    t.text     "description_e"
    t.decimal  "unit_price_e",  precision: 8, scale: 2
    t.decimal  "sale_price_e",  precision: 8, scale: 2
  end

  create_table "question_answers", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.decimal  "min_price"
    t.decimal  "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_products", force: :cascade do |t|
    t.string   "size"
    t.string   "color"
    t.integer  "qty"
    t.string   "itemcode"
    t.integer  "seq"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "size_s"
    t.string   "color_s"
    t.string   "size_e"
    t.string   "color_e"
  end

  create_table "user_authentications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "authentication_provider_id"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expires_at"
    t.text     "params"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "user_authentications", ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id", using: :btree
  add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
