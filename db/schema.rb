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

ActiveRecord::Schema.define(version: 20161126045114) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "charts", force: :cascade do |t|
    t.date     "date"
    t.string   "color"
    t.string   "clar"
    t.decimal  "weight2",    precision: 2, scale: 1
    t.integer  "price"
    t.string   "cut_grade"
    t.string   "fluorescen"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "column_list_clars", force: :cascade do |t|
    t.string   "clar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_list_colors", force: :cascade do |t|
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "column_lists", force: :cascade do |t|
    t.string   "color"
    t.string   "clar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diamonds", force: :cascade do |t|
    t.date     "date"
    t.string   "color"
    t.string   "clar"
    t.string   "cut_grade"
    t.integer  "rapnet_list_price"
    t.integer  "rapnet_discount"
    t.integer  "price_per_carat"
    t.string   "polish"
    t.string   "symmetry"
    t.string   "fluorescen"
    t.string   "certificate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight2",           precision: 4,  scale: 2
    t.decimal  "end_price",         precision: 12, scale: 1
    t.decimal  "length",            precision: 10, scale: 2
    t.decimal  "width",             precision: 10, scale: 2
    t.decimal  "depth",             precision: 10, scale: 2
    t.string   "shape"
    t.decimal  "depth_percent",     precision: 4,  scale: 1
    t.decimal  "table_percent",     precision: 4,  scale: 1
    t.string   "girdle_thin"
    t.string   "girdle_thick"
    t.float    "weight"
  end

  create_table "indices", force: :cascade do |t|
    t.date     "date"
    t.float    "index1"
    t.float    "index2"
    t.float    "index3"
    t.float    "index4"
    t.float    "index5"
    t.float    "price1"
    t.float    "price2"
    t.float    "price3"
    t.float    "price4"
    t.float    "price5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string   "color"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "if1",        precision: 12, scale: 1
    t.decimal  "vvs1",       precision: 12, scale: 1
    t.decimal  "vvs2",       precision: 12, scale: 1
    t.decimal  "vs1",        precision: 12, scale: 1
    t.decimal  "vs2",        precision: 12, scale: 1
    t.decimal  "si1",        precision: 12, scale: 1
    t.decimal  "si2",        precision: 12, scale: 1
    t.decimal  "weight2",    precision: 2,  scale: 1
  end

  create_table "tables", force: :cascade do |t|
    t.date     "date"
    t.string   "color"
    t.string   "clar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight2",    precision: 2, scale: 1
    t.integer  "price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
