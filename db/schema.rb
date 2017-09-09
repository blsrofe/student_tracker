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

ActiveRecord::Schema.define(version: 20170909212718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "observations", force: :cascade do |t|
    t.date "date"
    t.text "content"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "teacher"
    t.index ["student_id"], name: "index_observations_on_student_id"
  end

  create_table "section_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "section_id"
    t.index ["section_id"], name: "index_section_students_on_section_id"
    t.index ["student_id"], name: "index_section_students_on_student_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_sections_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "observations", "students"
  add_foreign_key "section_students", "sections"
  add_foreign_key "section_students", "students"
  add_foreign_key "sections", "teachers"
end
