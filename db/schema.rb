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

ActiveRecord::Schema.define(version: 20150130065121) do

  create_table "course_subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id", using: :btree
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "subject_id_id"
    t.string   "name"
    t.text     "content"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["subject_id_id"], name: "index_tasks_on_subject_id_id", using: :btree

  create_table "user_courses", force: true do |t|
    t.integer  "user_id_id"
    t.integer  "course_id_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_courses", ["course_id_id"], name: "index_user_courses_on_course_id_id", using: :btree
  add_index "user_courses", ["user_id_id"], name: "index_user_courses_on_user_id_id", using: :btree

  create_table "user_subjects", force: true do |t|
    t.integer  "user_id_id"
    t.integer  "subject_id_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_subjects", ["subject_id_id"], name: "index_user_subjects_on_subject_id_id", using: :btree
  add_index "user_subjects", ["user_id_id"], name: "index_user_subjects_on_user_id_id", using: :btree

  create_table "user_tasks", force: true do |t|
    t.integer  "user_id_id"
    t.integer  "task_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_tasks", ["user_id_id"], name: "index_user_tasks_on_user_id_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "supervisior"
    t.boolean  "study_status"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
