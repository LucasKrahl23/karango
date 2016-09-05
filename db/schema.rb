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

ActiveRecord::Schema.define(version: 20160820025725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abastecimentos", force: :cascade do |t|
    t.date     "abastecimento_dt"
    t.integer  "odometro"
    t.decimal  "precolitro"
    t.decimal  "precototal"
    t.string   "obs"
    t.integer  "veiculo_id"
    t.boolean  "completou_flag"
    t.integer  "combustivel_id"
    t.integer  "formaspagamento_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["combustivel_id"], name: "index_abastecimentos_on_combustivel_id", using: :btree
    t.index ["formaspagamento_id"], name: "index_abastecimentos_on_formaspagamento_id", using: :btree
    t.index ["veiculo_id"], name: "index_abastecimentos_on_veiculo_id", using: :btree
  end

  create_table "combustiveis", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "despesas", force: :cascade do |t|
    t.string   "descricao"
    t.date     "despesa_dt"
    t.decimal  "valor"
    t.integer  "formaspagamento_id"
    t.integer  "veiculo_id"
    t.string   "obs"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["formaspagamento_id"], name: "index_despesas_on_formaspagamento_id", using: :btree
    t.index ["veiculo_id"], name: "index_despesas_on_veiculo_id", using: :btree
  end

  create_table "formaspagamentos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impostos", force: :cascade do |t|
    t.string   "descricao"
    t.decimal  "valor"
    t.date     "vencimento_dt"
    t.string   "obs"
    t.boolean  "pago_flag"
    t.integer  "formaspagamento_id"
    t.integer  "veiculo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["formaspagamento_id"], name: "index_impostos_on_formaspagamento_id", using: :btree
    t.index ["veiculo_id"], name: "index_impostos_on_veiculo_id", using: :btree
  end

  create_table "manutencoes", force: :cascade do |t|
    t.string   "descricao"
    t.integer  "odometro"
    t.date     "manutencao_dt"
    t.decimal  "valor"
    t.date     "validade_dt"
    t.integer  "kmvalidade"
    t.string   "obs"
    t.integer  "formaspagamento_id"
    t.integer  "veiculo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["formaspagamento_id"], name: "index_manutencoes_on_formaspagamento_id", using: :btree
    t.index ["veiculo_id"], name: "index_manutencoes_on_veiculo_id", using: :btree
  end

  create_table "marcas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perfisusuarios", force: :cascade do |t|
    t.string   "nome"
    t.boolean  "admin_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tiposveiculos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "nome"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "token"
    t.index ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree
  end

  create_table "veiculos", force: :cascade do |t|
    t.string   "nome"
    t.string   "placa"
    t.integer  "usuario_id"
    t.integer  "marca_id"
    t.integer  "tiposveiculo_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["marca_id"], name: "index_veiculos_on_marca_id", using: :btree
    t.index ["tiposveiculo_id"], name: "index_veiculos_on_tiposveiculo_id", using: :btree
    t.index ["usuario_id"], name: "index_veiculos_on_usuario_id", using: :btree
  end

  add_foreign_key "abastecimentos", "combustiveis"
  add_foreign_key "abastecimentos", "formaspagamentos"
  add_foreign_key "abastecimentos", "veiculos"
  add_foreign_key "despesas", "formaspagamentos"
  add_foreign_key "despesas", "veiculos"
  add_foreign_key "impostos", "formaspagamentos"
  add_foreign_key "impostos", "veiculos"
  add_foreign_key "manutencoes", "formaspagamentos"
  add_foreign_key "manutencoes", "veiculos"
  add_foreign_key "veiculos", "marcas"
  add_foreign_key "veiculos", "tiposveiculos"
  add_foreign_key "veiculos", "usuarios"
end
