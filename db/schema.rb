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

ActiveRecord::Schema.define(version: 20150624033913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contrabands", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "contraband_file_name"
    t.string   "contraband_content_type"
    t.integer  "contraband_file_size"
    t.datetime "contraband_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "curation_id"
    t.string   "name"
  end

  add_index "contrabands", ["user_id"], name: "index_contrabands_on_user_id", using: :btree

  create_table "curations", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "curations", ["parent_id"], name: "index_curations_on_parent_id", using: :btree
  add_index "curations", ["user_id"], name: "index_curations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
