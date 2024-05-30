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

ActiveRecord::Schema[7.1].define(version: 2024_05_30_012338) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "run_submissions", force: :cascade do |t|
    t.bigint "run_id", null: false
    t.bigint "user_id", null: false
    t.float "progress", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_id"], name: "index_run_submissions_on_run_id"
    t.index ["user_id"], name: "index_run_submissions_on_user_id"
  end

  create_table "run_unit_submissions", force: :cascade do |t|
    t.bigint "run_submission_id", null: false
    t.bigint "user_id", null: false
    t.bigint "run_id", null: false
    t.bigint "run_unit_id", null: false
    t.float "progress", default: 0.0
    t.boolean "passing", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_id"], name: "index_run_unit_submissions_on_run_id"
    t.index ["run_submission_id"], name: "index_run_unit_submissions_on_run_submission_id"
    t.index ["run_unit_id"], name: "index_run_unit_submissions_on_run_unit_id"
    t.index ["user_id"], name: "index_run_unit_submissions_on_user_id"
  end

  create_table "run_units", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "indentation_level", default: 0
    t.bigint "run_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", null: false
    t.integer "weight", default: 5
    t.float "passing_progress", default: 1.0
    t.index ["run_id", "position"], name: "index_run_units_on_run_id_and_position", unique: true
    t.index ["run_id"], name: "index_run_units_on_run_id"
  end

  create_table "runs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "run_submissions", "runs"
  add_foreign_key "run_submissions", "users"
  add_foreign_key "run_unit_submissions", "run_submissions"
  add_foreign_key "run_unit_submissions", "run_units"
  add_foreign_key "run_unit_submissions", "runs"
  add_foreign_key "run_unit_submissions", "users"
  add_foreign_key "run_units", "runs"
end
