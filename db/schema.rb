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

ActiveRecord::Schema.define(version: 2019_12_26_192347) do

  create_table "npcs", force: :cascade do |t|
    t.string "npc_name"
    t.integer "quest_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.string "gear"
    t.integer "renown"
  end

  create_table "quest_logs", force: :cascade do |t|
    t.integer "player_id"
    t.integer "quest_id"
    t.boolean "quest_complete?"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title"
    t.string "quest_desc"
    t.string "reward"
    t.integer "add_renown"
    t.integer "npc_id"
  end

end
