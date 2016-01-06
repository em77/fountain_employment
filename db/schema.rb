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

ActiveRecord::Schema.define(version: 20160103010741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
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
  end

  add_index "listings", ["company_id"], name: "index_listings_on_company_id", using: :btree

  add_foreign_key "listings", "companies"
end
