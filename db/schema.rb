# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_19_184144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid", unique: true
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "token"
    t.datetime "accepted_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "given_name"
    t.string "family_name"
    t.string "email_address"
    t.string "nickname"
    t.string "address_street"
    t.string "address_additional"
    t.string "address_locality"
    t.string "address_region"
    t.string "address_country", default: "us"
    t.string "address_postal_code"
    t.string "phone_number"
    t.string "emergency_contact_name"
    t.string "emergency_contact_phone_number"
    t.string "pronouns"
    t.string "shirt_size"
    t.string "medical_note"
    t.boolean "inversed_full_name", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.integer "status", default: 0
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_users_on_profile_id"
  end

  add_foreign_key "authorizations", "users"
  add_foreign_key "invitations", "users"
  add_foreign_key "users", "profiles"
end
