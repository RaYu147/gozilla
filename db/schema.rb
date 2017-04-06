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

ActiveRecord::Schema.define(version: 20160907081904) do

  create_table "accounts", force: true do |t|
    t.integer  "authority_category",             null: false
    t.string   "login_id",           limit: 100, null: false
    t.string   "password",           limit: 256, null: false
    t.string   "account_name",       limit: 100, null: false
    t.string   "mail_address",       limit: 256, null: false
    t.string   "remarks",            limit: 256, null: false
    t.string   "slug",               limit: 10,  null: false
    t.integer  "status",                         null: false
    t.integer  "created_account_id",             null: false
    t.integer  "updated_account_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "accounts", ["created_account_id"], name: "accounts_created_account_id_fk", using: :btree
  add_index "accounts", ["updated_account_id"], name: "accounts_updated_account_id_fk", using: :btree

  create_table "exam_answers", force: true do |t|
    t.integer  "exam_info_id",            null: false
    t.integer  "test_info_id",            null: false
    t.integer  "question_choice_info_id", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "exam_answers", ["exam_info_id"], name: "exam_answers_exam_info_id_fk", using: :btree
  add_index "exam_answers", ["question_choice_info_id"], name: "exam_answers_question_choice_info_id_fk", using: :btree
  add_index "exam_answers", ["test_info_id"], name: "exam_answers_test_info_id_fk", using: :btree

  create_table "exam_infos", force: true do |t|
    t.integer  "account_id",         null: false
    t.integer  "test_basic_info_id", null: false
    t.integer  "exam_count",         null: false
    t.datetime "exam_complete_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "exam_infos", ["account_id"], name: "exam_infos_account_id_fk", using: :btree
  add_index "exam_infos", ["test_basic_info_id"], name: "exam_infos_test_basic_info_id_fk", using: :btree

  create_table "question_choice_infos", force: true do |t|
    t.integer  "question_info_id",               null: false
    t.integer  "choice_number",                  null: false
    t.string   "choice_contents",    limit: 256, null: false
    t.integer  "correct_status",                 null: false
    t.string   "slug",               limit: 10,  null: false
    t.integer  "created_account_id",             null: false
    t.integer  "updated_account_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "question_choice_infos", ["created_account_id"], name: "question_choice_infos_created_account_id_fk", using: :btree
  add_index "question_choice_infos", ["question_info_id"], name: "question_choice_infos_question_info_id_fk", using: :btree
  add_index "question_choice_infos", ["updated_account_id"], name: "question_choice_infos_updated_account_id_fk", using: :btree

  create_table "question_infos", force: true do |t|
    t.string   "question_contents",  limit: 256, null: false
    t.integer  "question_count",                 null: false
    t.string   "slug",               limit: 10,  null: false
    t.integer  "status",                         null: false
    t.integer  "created_account_id",             null: false
    t.integer  "updated_account_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "question_infos", ["created_account_id"], name: "question_infos_created_account_id_fk", using: :btree
  add_index "question_infos", ["updated_account_id"], name: "question_infos_updated_account_id_fk", using: :btree

  create_table "test_basic_infos", force: true do |t|
    t.integer  "year_management_id",            null: false
    t.integer  "question_count",                null: false
    t.integer  "pass_grade",                    null: false
    t.string   "slug",               limit: 10, null: false
    t.integer  "created_account_id",            null: false
    t.integer  "updated_account_id",            null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "test_basic_infos", ["created_account_id"], name: "test_basic_infos_created_account_id_fk", using: :btree
  add_index "test_basic_infos", ["updated_account_id"], name: "test_basic_infos_updated_account_id_fk", using: :btree
  add_index "test_basic_infos", ["year_management_id"], name: "test_basic_infos_year_management_id_fk", using: :btree

  create_table "test_infos", force: true do |t|
    t.integer  "test_basic_info_id",            null: false
    t.integer  "question_info_id",              null: false
    t.integer  "question_number",               null: false
    t.string   "slug",               limit: 10, null: false
    t.integer  "created_account_id",            null: false
    t.integer  "updated_account_id",            null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "test_infos", ["created_account_id"], name: "test_infos_created_account_id_fk", using: :btree
  add_index "test_infos", ["question_info_id"], name: "test_infos_question_info_id_fk", using: :btree
  add_index "test_infos", ["test_basic_info_id"], name: "test_infos_test_basic_info_id_fk", using: :btree
  add_index "test_infos", ["updated_account_id"], name: "test_infos_updated_account_id_fk", using: :btree

  create_table "year_managements", force: true do |t|
    t.integer  "year",                           null: false
    t.string   "year_name",          limit: 100, null: false
    t.date     "start_date",                     null: false
    t.date     "end_date",                       null: false
    t.string   "remarks",            limit: 256, null: false
    t.string   "slug",               limit: 10,  null: false
    t.integer  "status",                         null: false
    t.integer  "created_account_id",             null: false
    t.integer  "updated_account_id",             null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "year_managements", ["created_account_id"], name: "year_managements_created_account_id_fk", using: :btree
  add_index "year_managements", ["updated_account_id"], name: "year_managements_updated_account_id_fk", using: :btree

  add_foreign_key "accounts", "accounts", name: "accounts_created_account_id_fk", column: "created_account_id"
  add_foreign_key "accounts", "accounts", name: "accounts_updated_account_id_fk", column: "updated_account_id"

  add_foreign_key "exam_answers", "exam_infos", name: "exam_answers_exam_info_id_fk"
  add_foreign_key "exam_answers", "question_choice_infos", name: "exam_answers_question_choice_info_id_fk"
  add_foreign_key "exam_answers", "test_infos", name: "exam_answers_test_info_id_fk"

  add_foreign_key "exam_infos", "accounts", name: "exam_infos_account_id_fk"
  add_foreign_key "exam_infos", "test_basic_infos", name: "exam_infos_test_basic_info_id_fk"

  add_foreign_key "question_choice_infos", "accounts", name: "question_choice_infos_created_account_id_fk", column: "created_account_id"
  add_foreign_key "question_choice_infos", "accounts", name: "question_choice_infos_updated_account_id_fk", column: "updated_account_id"
  add_foreign_key "question_choice_infos", "question_infos", name: "question_choice_infos_question_info_id_fk"

  add_foreign_key "question_infos", "accounts", name: "question_infos_created_account_id_fk", column: "created_account_id"
  add_foreign_key "question_infos", "accounts", name: "question_infos_updated_account_id_fk", column: "updated_account_id"

  add_foreign_key "test_basic_infos", "accounts", name: "test_basic_infos_created_account_id_fk", column: "created_account_id"
  add_foreign_key "test_basic_infos", "accounts", name: "test_basic_infos_updated_account_id_fk", column: "updated_account_id"
  add_foreign_key "test_basic_infos", "year_managements", name: "test_basic_infos_year_management_id_fk"

  add_foreign_key "test_infos", "accounts", name: "test_infos_created_account_id_fk", column: "created_account_id"
  add_foreign_key "test_infos", "accounts", name: "test_infos_updated_account_id_fk", column: "updated_account_id"
  add_foreign_key "test_infos", "question_infos", name: "test_infos_question_info_id_fk"
  add_foreign_key "test_infos", "test_basic_infos", name: "test_infos_test_basic_info_id_fk"

  add_foreign_key "year_managements", "accounts", name: "year_managements_created_account_id_fk", column: "created_account_id"
  add_foreign_key "year_managements", "accounts", name: "year_managements_updated_account_id_fk", column: "updated_account_id"

end
