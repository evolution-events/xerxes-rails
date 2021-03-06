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

ActiveRecord::Schema.define(version: 20131228133819) do

  create_table "emergency_contacts", force: true do |t|
    t.string   "name"
    t.string   "relation"
    t.string   "phone_number"
    t.text     "remarks"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emergency_contacts", ["user_id"], name: "index_emergency_contacts_on_user_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location_name"
    t.text     "location_info"
    t.text     "description"
    t.string   "url"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["series_id"], name: "index_events_on_series_id"

  create_table "medical_details", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medical_details", ["user_id"], name: "index_medical_details_on_user_id"

  create_table "registrations", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["event_id"], name: "index_registrations_on_event_id"
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id"

  create_table "series", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "user_addresses", force: true do |t|
    t.string   "address"
    t.string   "postal_code"
    t.string   "city"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_addresses", ["user_id"], name: "index_user_addresses_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "preposition"
    t.string   "last_name"
    t.string   "username"
    t.date     "birthdate"
    t.string   "phone_number"
    t.string   "email"
    t.string   "gender"
    t.boolean  "hide_last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remember_address"
    t.boolean  "remember_emergency_contacts"
    t.boolean  "firstaid"
    t.boolean  "bhv"
  end

end
