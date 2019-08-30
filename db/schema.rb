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

ActiveRecord::Schema.define(version: 2019_08_24_090510) do

  create_table "answer_options", force: :cascade do |t|
    t.integer "choice_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_options_on_answer_id"
    t.index ["choice_id"], name: "index_answer_options_on_choice_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spend_time"
    t.integer "score"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["test_id"], name: "index_answers_on_test_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "question_id"
    t.string "choice"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.string "q_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  # create_table "test_papers", force: :cascade do |t|
  #   t.integer "question_id"
  #   t.integer "test_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["question_id"], name: "index_test_papers_on_question_id"
  #   t.index ["test_id"], name: "index_test_papers_on_test_id"
  # end

  create_table "test_questions", force: :cascade do |t|
    t.integer "question_id"
    t.integer "test_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_test_questions_on_question_id"
    t.index ["test_id"], name: "index_test_questions_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "no_of_questions"
    t.time "duration"
    t.text "description"
    t.integer "total_mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "role", default: "user"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
