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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121120143308) do

  create_table "administradores", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "cpf",        :null => false
    t.string   "login",      :null => false
    t.string   "senha_salt", :null => false
    t.string   "senha_hash", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "moteis", :force => true do |t|
    t.string   "nome",              :limit => 100, :null => false
    t.string   "endereco",          :limit => 100, :null => false
    t.string   "endnumero",         :limit => 6
    t.string   "endcomplemento",    :limit => 100
    t.string   "cidade",            :limit => 100, :null => false
    t.string   "uf",                               :null => false
    t.string   "telefone1",         :limit => 20
    t.string   "telefone2",         :limit => 20
    t.float    "latitude",                         :null => false
    t.float    "longitude",                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ativo"
    t.string   "cep"
    t.string   "bairro"
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  create_table "sugestoes", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "email",      :null => false
    t.text     "mensagem",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suites", :force => true do |t|
    t.text     "descricao"
    t.float    "valor",                     :null => false
    t.string   "nome",       :limit => 100, :null => false
    t.integer  "motel_id",                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
