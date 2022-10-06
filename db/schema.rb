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

ActiveRecord::Schema.define(version: 2022_09_22_014533) do

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "validated"
  end

  create_table "commentshavecomments", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "othercomment_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "image"
    t.text "content"
    t.date "begindate"
    t.date "enddate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eventshavecomments", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "event_id"
  end

  create_table "eventshavepics", force: :cascade do |t|
    t.integer "image_id"
    t.integer "event_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "image"
    t.text "content"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "newshavecomments", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "news_id"
  end

  create_table "newshavepics", force: :cascade do |t|
    t.integer "image_id"
    t.integer "news_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "image"
    t.text "content"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
  end

  create_table "postshavecomments", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "post_id"
  end

  create_table "postshavepics", force: :cascade do |t|
    t.integer "post_id"
    t.integer "image_id"
  end

  create_table "press_releases", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.string "url"
    t.string "image"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pressreleaseshavecomments", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "press_release_id"
  end

  create_table "pressreleaseshavepics", force: :cascade do |t|
    t.integer "image_id"
    t.integer "press_release_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
