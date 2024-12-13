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

ActiveRecord::Schema[7.2].define(version: 2024_12_13_012623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "due_date"
    t.string "status"
    t.float "grade"
    t.text "feedback"
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "url"
    t.bigint "assignment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignment_id"], name: "index_resources_on_assignment_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.string "name"
    t.string "uuid_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "professor"
    t.integer "credits"
    t.string "status"
    t.float "final_grade"
    t.bigint "semester_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_subjects_on_schedule_id"
    t.index ["semester_id"], name: "index_subjects_on_semester_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assignments", "subjects"
  add_foreign_key "resources", "assignments"
  add_foreign_key "subjects", "schedules"
  add_foreign_key "subjects", "semesters"
end
