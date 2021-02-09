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

ActiveRecord::Schema.define(version: 20210208234801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assinaturas", force: :cascade do |t|
    t.string   "imei"
    t.decimal  "preco_anual",     precision: 10, scale: 2, default: "0.0"
    t.integer  "num_parcelas"
    t.integer  "modelo_id"
    t.integer  "cliente_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.date     "data_emisao"
    t.date     "data_vencimento"
    t.index ["cliente_id"], name: "index_assinaturas_on_cliente_id", using: :btree
    t.index ["modelo_id"], name: "index_assinaturas_on_modelo_id", using: :btree
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modelos", force: :cascade do |t|
    t.string   "nome"
    t.integer  "marca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marca_id"], name: "index_modelos_on_marca_id", using: :btree
  end

  add_foreign_key "assinaturas", "clientes"
  add_foreign_key "assinaturas", "modelos"
  add_foreign_key "modelos", "marcas"
end
