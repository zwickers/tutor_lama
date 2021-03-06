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

ActiveRecord::Schema.define(version: 20200403025727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.datetime "time"
    t.integer  "tutor_search_id"
    t.integer  "tutee_search_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "author"
  end

  create_table "numbers", force: :cascade do |t|
    t.integer  "subject_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "numbers", ["subject_id"], name: "index_numbers_on_subject_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "receiver_id"
    t.integer  "number_id"
    t.text     "title"
    t.text     "text"
    t.text     "contact"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "tutee_search_id"
    t.integer  "tutor_search_id"
  end

  add_index "requests", ["number_id"], name: "index_requests_on_number_id", using: :btree
  add_index "requests", ["tutee_search_id"], name: "index_requests_on_tutee_search_id", using: :btree
  add_index "requests", ["tutor_search_id"], name: "index_requests_on_tutor_search_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutee_searches", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number_id"
  end

  add_index "tutee_searches", ["number_id"], name: "index_tutee_searches_on_number_id", using: :btree
  add_index "tutee_searches", ["user_id"], name: "index_tutee_searches_on_user_id", using: :btree

  create_table "tutor_searches", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number_id"
  end

  add_index "tutor_searches", ["number_id"], name: "index_tutor_searches_on_number_id", using: :btree
  add_index "tutor_searches", ["user_id"], name: "index_tutor_searches_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "image"
    t.string   "bio"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "numbers", "subjects"
  add_foreign_key "requests", "numbers"
  add_foreign_key "requests", "tutee_searches"
  add_foreign_key "requests", "tutor_searches"
  add_foreign_key "tutee_searches", "numbers"
  add_foreign_key "tutee_searches", "users"
  add_foreign_key "tutor_searches", "numbers"
  add_foreign_key "tutor_searches", "users"
end
