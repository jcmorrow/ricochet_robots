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

ActiveRecord::Schema.define(version: 20171031160854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "size", default: 16, null: false
  end

  create_table "goals", id: :serial, force: :cascade do |t|
    t.integer "space_id"
    t.string "color"
    t.boolean "satisfied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", id: :serial, force: :cascade do |t|
    t.integer "robot_id"
    t.string "direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "robots", id: :serial, force: :cascade do |t|
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "space_id"
    t.index ["space_id"], name: "index_robots_on_space_id"
  end

  create_table "solutions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "board_id"
    t.bigint "original_board_id"
    t.index ["board_id"], name: "index_solutions_on_board_id"
    t.index ["original_board_id"], name: "index_solutions_on_original_board_id"
  end

  create_table "spaces", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row", null: false
    t.integer "column", null: false
    t.bigint "board_id"
    t.index ["board_id"], name: "index_spaces_on_board_id"
  end

  create_table "walls", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "wall_type", default: 0, null: false
    t.bigint "space_id"
    t.index ["space_id"], name: "index_walls_on_space_id"
  end

  add_foreign_key "robots", "spaces"
  add_foreign_key "solutions", "boards"
  add_foreign_key "solutions", "boards", column: "original_board_id"
  add_foreign_key "spaces", "boards"
  add_foreign_key "walls", "spaces"
end
