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

ActiveRecord::Schema.define(version: 20211127193735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "social_enterprise", default: false, null: false
  end

  create_table "external_listings", force: :cascade do |t|
    t.string   "job_title"
    t.string   "company_name"
    t.string   "location"
    t.string   "job_listing_url"
    t.string   "pay_rate"
    t.string   "job_type"
    t.string   "no_of_hires"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "member_working"
    t.string   "job_title"
    t.string   "description"
    t.text     "working_hours_desc"
    t.integer  "hours_weekly"
    t.string   "shift"
    t.string   "start_date"
    t.string   "est_end_date"
    t.integer  "wage"
    t.text     "te_placement_manager"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "company_id"
    t.string   "employment_type"
  end

  add_index "listings", ["company_id"], name: "index_listings_on_company_id", using: :btree

  add_foreign_key "listings", "companies"
end
