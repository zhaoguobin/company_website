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

ActiveRecord::Schema.define(version: 20150310070224) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "item_type_id", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "index_images", force: true do |t|
    t.string   "photo"
    t.string   "link"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "photo"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "key",         null: false
    t.text     "value"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["target_type", "target_id", "key"], name: "index_settings_on_target_type_and_target_id_and_key", unique: true

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "name"
    t.integer  "role_id",         default: 0
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
