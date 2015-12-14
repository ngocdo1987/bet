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

ActiveRecord::Schema.define(version: 20151214054056) do

  create_table "bet_money_lines", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "odd_id"
    t.integer  "match_id"
    t.float    "stake"
    t.float    "profit"
    t.string   "option"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bet_money_lines", ["match_id"], name: "index_bet_money_lines_on_match_id"
  add_index "bet_money_lines", ["odd_id"], name: "index_bet_money_lines_on_odd_id"
  add_index "bet_money_lines", ["user_id"], name: "index_bet_money_lines_on_user_id"

  create_table "bet_spreads", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "odd_id"
    t.integer  "match_id"
    t.float    "stake"
    t.float    "profit"
    t.string   "option"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bet_spreads", ["match_id"], name: "index_bet_spreads_on_match_id"
  add_index "bet_spreads", ["odd_id"], name: "index_bet_spreads_on_odd_id"
  add_index "bet_spreads", ["user_id"], name: "index_bet_spreads_on_user_id"

  create_table "bet_total_points", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "odd_id"
    t.integer  "match_id"
    t.float    "stake"
    t.float    "profit"
    t.string   "option"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bet_total_points", ["match_id"], name: "index_bet_total_points_on_match_id"
  add_index "bet_total_points", ["odd_id"], name: "index_bet_total_points_on_odd_id"
  add_index "bet_total_points", ["user_id"], name: "index_bet_total_points_on_user_id"

  create_table "leagues", force: :cascade do |t|
    t.string   "league_name"
    t.string   "league_type"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "league_id"
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_number", limit: 3
    t.integer  "away_number", limit: 3
    t.integer  "home_score",  limit: 1
    t.integer  "away_score",  limit: 1
    t.datetime "match_time"
    t.string   "status"
    t.boolean  "calculated"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["league_id"], name: "index_matches_on_league_id"

  create_table "odd_money_lines", force: :cascade do |t|
    t.integer  "match_id"
    t.float    "home_odd"
    t.float    "away_odd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "odd_money_lines", ["match_id"], name: "index_odd_money_lines_on_match_id"

  create_table "odd_spreads", force: :cascade do |t|
    t.integer  "match_id"
    t.float    "home_hdc"
    t.float    "away_hdc"
    t.float    "home_odd"
    t.float    "away_odd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "odd_spreads", ["match_id"], name: "index_odd_spreads_on_match_id"

  create_table "odd_total_points", force: :cascade do |t|
    t.integer  "match_id"
    t.float    "over_hdc"
    t.float    "under_hdc"
    t.float    "over_odd"
    t.float    "under_odd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "odd_total_points", ["match_id"], name: "index_odd_total_points_on_match_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end