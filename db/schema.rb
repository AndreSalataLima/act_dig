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

ActiveRecord::Schema[7.1].define(version: 2024_01_17_113505) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.string "machine"
    t.time "duration"
    t.integer "weight"
    t.integer "repetition"
    t.integer "serie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_exercises_on_session_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.float "distance"
    t.float "speed"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_sensors_on_exercise_id"
  end

  create_table "session_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_histories_on_session_id"
    t.index ["user_id"], name: "index_session_histories_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "weight"
    t.integer "height"
    t.string "level"
    t.string "objective"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercises", "sessions"
  add_foreign_key "sensors", "exercises"
  add_foreign_key "session_histories", "sessions"
  add_foreign_key "session_histories", "users"
  add_foreign_key "sessions", "users"
end
