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

ActiveRecord::Schema.define(version: 20140223001637) do

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "coins"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "workers", force: true do |t|
    t.string   "name"
    t.float    "hashrate"
    t.boolean  "online"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "accepted"
    t.integer  "rejected"
    t.integer  "hw_errors"
    t.integer  "num_gpu"
    t.string   "pool"
    t.string   "worker_user_name"
    t.integer  "GPUT1"
    t.integer  "GPUT2"
    t.integer  "GPUT3"
    t.integer  "GPUT4"
    t.float    "GPUH1"
    t.float    "GPUH2"
    t.float    "GPUH3"
    t.float    "GPUH4"
    t.boolean  "pool_online"
  end

  add_index "workers", ["user_id"], name: "index_workers_on_user_id"

end
