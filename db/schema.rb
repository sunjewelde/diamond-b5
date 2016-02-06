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

ActiveRecord::Schema.define(version: 20160205031023) do

  create_table "diamonds", force: :cascade do |t|
    t.date     "date"
    t.float    "weight"
    t.string   "color"
    t.string   "clar"
    t.float    "end_price"
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
  end

  create_table "lists", force: :cascade do |t|
    t.string   "color"
    t.float    "if1"
    t.float    "vvs1"
    t.float    "vvs2"
    t.float    "vs1"
    t.float    "vs2"
    t.float    "si1"
    t.float    "si2"
    t.date     "date"
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
