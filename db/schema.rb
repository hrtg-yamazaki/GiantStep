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

ActiveRecord::Schema.define(version: 2020_02_14_052843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "records", force: :cascade do |t|
    t.integer "sleep", null: false
    t.integer "study", null: false
    t.integer "exercise", null: false
    t.integer "diet", null: false
    t.integer "habit", null: false
    t.integer "aim", null: false
    t.integer "login", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "sleep", default: 0, null: false
    t.integer "study", default: 0, null: false
    t.integer "exercise", default: 0, null: false
    t.integer "diet", default: 0, null: false
    t.integer "habit", default: 0, null: false
    t.integer "aim", default: 0, null: false
    t.integer "login", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", null: false
    t.text "profile", default: "", null: false
    t.date "birthday", null: false
    t.integer "gender", default: 0, null: false
    t.integer "privacy", limit: 2, default: 1, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "yardsticks", force: :cascade do |t|
    t.string "sleep", null: false
    t.string "study", null: false
    t.string "exercise", null: false
    t.string "diet", null: false
    t.string "habit", null: false
    t.string "aim", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_yardsticks_on_user_id"
  end

  add_foreign_key "records", "users"
  add_foreign_key "statuses", "users"
  add_foreign_key "yardsticks", "users"
end
