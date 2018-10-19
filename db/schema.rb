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

ActiveRecord::Schema.define(version: 20181019020204) do

  create_table "meals", force: :cascade do |t|
    t.string  "dish_name"
    t.string  "cook_time"
    t.integer "price"
    t.boolean "available?"
    t.integer "table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "table_number"
    t.integer "head_count"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "dob"
    t.string "password_digest"
  end

end
