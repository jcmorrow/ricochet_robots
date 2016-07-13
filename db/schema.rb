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

ActiveRecord::Schema.define(version: 20160712154046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "size"
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "space_id"
    t.string   "color"
    t.boolean  "satisfied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.integer  "robot_id"
    t.string   "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "robots", force: :cascade do |t|
    t.string   "color"
    t.integer  "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.integer  "board_id"
    t.integer  "original_board_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["board_id"], name: "index_solutions_on_board_id", using: :btree
    t.index ["original_board_id"], name: "index_solutions_on_original_board_id", using: :btree
  end

  create_table "spaces", force: :cascade do |t|
    t.integer  "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "row"
    t.integer  "column"
  end

  create_table "wall_types", force: :cascade do |t|
    t.boolean  "up"
    t.boolean  "right"
    t.boolean  "down"
    t.boolean  "left"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "walls", force: :cascade do |t|
    t.integer  "space_id"
    t.integer  "wall_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
