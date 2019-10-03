ActiveRecord::Schema.define(version: 2019_09_26_033113) do
  enable_extension "plpgsql"

  create_table "department_with_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_department_with_users_on_department_id"
    t.index ["user_id"], name: "index_department_with_users_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.integer "name", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reply_to_issues", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reply_to_issues_on_user_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "date"
    t.integer "hr", default: 1
    t.integer "hourly_wage", default: 150
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_salaries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "123123", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "number"
    t.integer "role", default: 2
    t.string "phone"
    t.integer "gender", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "department_with_users", "departments"
  add_foreign_key "department_with_users", "users"
  add_foreign_key "reply_to_issues", "users"
  add_foreign_key "salaries", "users"
end
