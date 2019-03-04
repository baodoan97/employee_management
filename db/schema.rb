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

ActiveRecord::Schema.define(version: 2019_03_01_065945) do

  create_table "adminmanas", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_adminmanas_on_email", unique: true
    t.index ["reset_password_token"], name: "index_adminmanas_on_reset_password_token", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.integer "task_id"
    t.string "pictrue_file_name"
    t.string "pictrue_content_type"
    t.integer "pictrue_file_size"
    t.datetime "pictrue_updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskname"
    t.string "content"
    t.date "date"
    t.integer "status", default: 0, null: false
  end

  create_table "user_tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "admin"
  end

end
