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

ActiveRecord::Schema.define(version: 20160306042219) do

  create_table "hunt_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hunt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hunts", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string   "common_name"
    t.string   "botanical_name"
    t.string   "family"
    t.string   "location_in_garden"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "geo"
    t.string   "claim_type"
    t.string   "image"
    t.string   "draft"
    t.integer  "hunt_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "role"
    t.boolean  "admin",      default: false
    t.integer  "score",      default: 0
  end

end
