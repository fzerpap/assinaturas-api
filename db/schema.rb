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

ActiveRecord::Schema.define(version: 20210129200920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "currency_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["currency_id"], name: "index_countries_on_currency_id", using: :btree
    t.index ["language_id"], name: "index_countries_on_language_id", using: :btree
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "cnpj"
    t.string   "cep"
    t.decimal  "caixa_principal_saldo", precision: 10, scale: 2, default: "0.0"
    t.decimal  "caixa_troco_saldo",     precision: 10, scale: 2, default: "0.0"
    t.date     "data_inicio_saldo"
    t.integer  "country_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.index ["country_id"], name: "index_empresas_on_country_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "countries", "currencies"
  add_foreign_key "countries", "languages"
  add_foreign_key "empresas", "countries"
end
