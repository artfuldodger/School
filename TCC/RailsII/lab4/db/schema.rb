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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120325044358) do

  create_table "items", :force => true do |t|
    t.integer  "store_id"
    t.string   "name"
    t.integer  "quantity"
    t.boolean  "weekly"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "done"
  end

  add_index "items", ["store_id"], :name => "index_items_on_store_id"

  create_table "stores", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["user_id"], :name => "index_stores_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
