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

ActiveRecord::Schema.define(version: 20170913182043) do

  create_table "auction_items", force: :cascade do |t|
    t.integer "auction_id"
    t.integer "prod_id"
    t.integer "winner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auctions", force: :cascade do |t|
    t.integer "admin_id"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bidding_tables", force: :cascade do |t|
    t.integer "auction_id"
    t.integer "prod_id"
    t.string "time"
    t.float "biding_price"
    t.integer "bidder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recieve_id"
    t.string "message"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "category"
    t.string "desc"
    t.string "name"
    t.string "image"
    t.float "min_bid"
    t.integer "seller_id"
    t.string "auction_status"
    t.integer "verified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "addr"
    t.string "gender"
    t.string "usertype"
    t.string "email"
    t.string "phno"
    t.integer "verified_by"
    t.string "pwd"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
