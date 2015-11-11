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

ActiveRecord::Schema.define(version: 20151110235411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street_no"
    t.string   "street_name"
    t.string   "city"
    t.string   "region"
    t.string   "postal_code"
    t.integer  "place_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "addresses", ["place_id"], name: "index_addresses_on_place_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "place_id"
    t.string   "name"
    t.string   "image_url"
    t.string   "rating"
    t.string   "phone_no"
    t.string   "website"
    t.string   "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "user_follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followable_id"
    t.string   "followable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_follows", ["followable_type", "followable_id"], name: "index_user_follows_on_followable_type_and_followable_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "uid",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "name"
    t.string   "oauth_token"
  end

  add_foreign_key "addresses", "places"
end
