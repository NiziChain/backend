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

ActiveRecord::Schema[7.0].define(version: 2022_09_11_151818) do
  create_table "authors", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_authors_on_address", unique: true
  end

  create_table "originals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.integer "content_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_originals_on_author_id"
    t.index ["content_id", "title"], name: "index_originals_on_content_id_and_title", unique: true
  end

  create_table "secondaries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "original_id", null: false
    t.integer "content_id", default: 0, null: false
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_secondaries_on_author_id"
    t.index ["content_id", "title"], name: "index_secondaries_on_content_id_and_title", unique: true
    t.index ["original_id"], name: "index_secondaries_on_original_id"
  end

  add_foreign_key "originals", "authors"
  add_foreign_key "secondaries", "authors"
  add_foreign_key "secondaries", "originals"
end
