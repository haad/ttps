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

ActiveRecord::Schema.define(version: 20140329152951) do

  create_table "payments", force: true do |t|
    t.integer  "payment_amount"
    t.string   "name"
    t.integer  "player_id"
    t.integer  "travel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["player_id"], name: "index_payments_on_player_id"
  add_index "payments", ["travel_id"], name: "index_payments_on_travel_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bank_account"
  end

  create_table "players_travels", force: true do |t|
    t.integer "player_id"
    t.integer "travel_id"
    t.boolean "driver"
  end

  add_index "players_travels", ["player_id"], name: "index_players_travels_on_player_id"
  add_index "players_travels", ["travel_id"], name: "index_players_travels_on_travel_id"

  create_table "travel_tickets", force: true do |t|
    t.string   "ticket_img"
    t.string   "name"
    t.integer  "ticket_sum"
    t.integer  "travel_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "travel_tickets", ["player_id"], name: "index_travel_tickets_on_player_id"
  add_index "travel_tickets", ["travel_id"], name: "index_travel_tickets_on_travel_id"

  create_table "travels", force: true do |t|
    t.string   "destination"
    t.text     "description"
    t.integer  "cars_count"
    t.integer  "travel_distance"
    t.date     "travel_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
