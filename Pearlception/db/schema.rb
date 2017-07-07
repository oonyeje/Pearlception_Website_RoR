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

ActiveRecord::Schema.define(version: 20170523145908) do

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "company_name"
    t.string   "company_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "distributors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "Full_name",  limit: 100, null: false
    t.string   "Short_name", limit: 10,  null: false
    t.float    "Volume_max", limit: 53
    t.float    "Volume_min", limit: 53
    t.float    "Length_max", limit: 53
    t.float    "Length_min", limit: 53
    t.float    "Width_max",  limit: 53
    t.float    "Width_min",  limit: 53
    t.float    "Height_max", limit: 53
    t.float    "Height_min", limit: 53
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["Short_name"], name: "index_grades_on_Short_name", unique: true, using: :btree
  end

  create_table "machines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "key",        limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "oysters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "run_id",                null: false
    t.string   "grade",      limit: 50, null: false
    t.float    "volume",     limit: 53
    t.float    "length",     limit: 53
    t.float    "width",      limit: 53
    t.float    "height",     limit: 53
    t.integer  "machine_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["machine_id"], name: "index_oysters_on_machine_id", using: :btree
    t.index ["run_id"], name: "index_oysters_on_run_id", using: :btree
  end

  create_table "results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "total",      null: false
    t.integer  "grade1"
    t.integer  "grade2"
    t.integer  "grade3"
    t.integer  "grade4"
    t.integer  "grade5"
    t.integer  "grade6"
    t.integer  "grade7"
    t.integer  "grade8"
    t.integer  "grade9"
    t.integer  "grade10"
    t.integer  "machine_id"
    t.integer  "run_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_results_on_machine_id", using: :btree
    t.index ["run_id"], name: "index_results_on_run_id", using: :btree
  end

  create_table "runs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "runDate",                 null: false
    t.string   "location",     limit: 50
    t.string   "harvest_time", limit: 50
    t.string   "supplier",     limit: 50
    t.string   "distributor",  limit: 50
    t.string   "other",        limit: 50
    t.integer  "machine_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["machine_id"], name: "index_runs_on_machine_id", using: :btree
  end

  create_table "suppliers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.integer  "company_id",             default: -1,    null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
