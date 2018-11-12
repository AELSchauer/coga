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

ActiveRecord::Schema.define(version: 20181111235646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "email_domain"
    t.string   "website_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "company_partners", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_partners_on_company_id", using: :btree
    t.index ["partner_id"], name: "index_company_partners_on_partner_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer  "min_volunteers"
    t.integer  "max_volunteers"
    t.string   "url"
    t.integer  "partner_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["partner_id"], name: "index_events_on_partner_id", using: :btree
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "email_domain"
    t.string   "website_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "name"
    t.string   "roleable_type"
    t.integer  "roleable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["roleable_type", "roleable_id"], name: "index_roles_on_roleable_type_and_roleable_id", using: :btree
  end

  create_table "social_networks", force: :cascade do |t|
    t.string   "name"
    t.json     "profile_template"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "social_profiles", force: :cascade do |t|
    t.json     "profile_data"
    t.string   "organizaton_type"
    t.integer  "organization_id"
    t.integer  "social_network_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["social_network_id"], name: "index_social_profiles_on_social_network_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_subscriptions_on_partner_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "primary_email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "status",             default: 0
    t.string   "confirmation_token"
    t.boolean  "email_confirmed",    default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", using: :btree
    t.index ["primary_email"], name: "index_users_on_primary_email", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "status"
    t.integer  "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_volunteers_on_event_id", using: :btree
    t.index ["user_id"], name: "index_volunteers_on_user_id", using: :btree
  end

  add_foreign_key "company_partners", "companies"
  add_foreign_key "company_partners", "partners"
  add_foreign_key "events", "partners"
  add_foreign_key "social_profiles", "social_networks"
  add_foreign_key "subscriptions", "partners"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "volunteers", "events"
  add_foreign_key "volunteers", "users"
end
