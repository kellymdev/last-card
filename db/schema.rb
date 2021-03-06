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

ActiveRecord::Schema.define(version: 20151003015826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string   "value"
    t.string   "suit"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deck_cards", force: :cascade do |t|
    t.integer  "card_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "game_id"
    t.integer  "sequence_number"
    t.integer  "player_id"
    t.boolean  "has_been_played", default: false, null: false
  end

  add_index "deck_cards", ["card_id"], name: "index_deck_cards_on_card_id", using: :btree
  add_index "deck_cards", ["game_id"], name: "index_deck_cards_on_game_id", using: :btree
  add_index "deck_cards", ["player_id"], name: "index_deck_cards_on_player_id", using: :btree

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "score",       default: 0
    t.integer  "game_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "is_computer", default: false, null: false
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree

  create_table "turns", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "deck_card_id"
    t.integer  "game_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
