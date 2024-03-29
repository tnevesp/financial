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

ActiveRecord::Schema.define(:version => 20130108161810) do

  create_table "expenses", :force => true do |t|
    t.integer  "store_id"
    t.decimal  "cost",            :precision => 10, :scale => 2
    t.string   "comment"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "payment_type_id"
    t.date     "payment_at"
  end

  add_index "expenses", ["payment_type_id"], :name => "index_expenses_on_payment_type_id"
  add_index "expenses", ["store_id"], :name => "index_expenses_on_store_id"

  create_table "payment_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "store_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "store_type_id"
  end

  add_index "stores", ["store_type_id"], :name => "index_stores_on_store_type_id"

end
