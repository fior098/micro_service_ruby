ActiveRecord::Schema[7.1].define(version: 2024_01_01_000003) do
  enable_extension "plpgsql"

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.integer "number", null: false
    t.string "letter", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "surname", null: false
    t.integer "class_id", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "school_classes", "schools"
  add_foreign_key "students", "school_classes", column: "class_id"
  add_foreign_key "students", "schools", column: "school_id"
end
