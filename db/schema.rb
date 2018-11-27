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

ActiveRecord::Schema.define(version: 2018_11_14_050443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email_domain"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.integer "name"
    t.string "roleable_type"
    t.integer "roleable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roleable_type", "roleable_id"], name: "index_roles_on_roleable_type_and_roleable_id"
  end

  create_table "tokens", id: :serial, force: :cascade do |t|
    t.integer "name"
    t.string "token"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_tokens_on_token"
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "primary_email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["primary_email"], name: "index_users_on_primary_email"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "tokens", "users"
end
