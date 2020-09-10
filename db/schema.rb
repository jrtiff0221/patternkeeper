# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_10_033453) do

  create_table "comments", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "message"
    t.integer "user_id"
    t.string "pattern_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pattern_id"], name: "index_comments_on_pattern_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "patterns", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.integer "published_date"
    t.string "category"
    t.string "difficulty"
    t.text "description"
    t.string "name"
    t.string "website"
    t.integer "pattern_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
