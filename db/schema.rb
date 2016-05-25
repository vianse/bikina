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

ActiveRecord::Schema.define(version: 20160524193221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comentarios", force: :cascade do |t|
    t.string   "comentario"
    t.string   "user_id"
    t.string   "grupo_id"
    t.string   "registro_id"
    t.string   "name_user"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cps", force: :cascade do |t|
    t.string   "codigo"
    t.string   "asentamiento"
    t.string   "tipoAsentamiento"
    t.string   "municipio"
    t.string   "estado"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "fotos", force: :cascade do |t|
    t.text     "photo"
    t.string   "registro_id"
    t.string   "user_id"
    t.string   "grupo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "user_id"
    t.string   "clave"
    t.string   "publicado"
    t.string   "tipo"
    t.string   "cp"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "recurring"
    t.string   "period"
    t.integer  "cycles"
  end

  create_table "megusta", force: :cascade do |t|
    t.string   "megusta"
    t.string   "user_id"
    t.string   "grupo_id"
    t.string   "registro_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "perfils", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cp"
    t.string   "colonio"
    t.string   "user_id"
    t.text     "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registros", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "direccion"
    t.string   "telefono1"
    t.string   "correo"
    t.string   "sitioweb"
    t.string   "logo"
    t.string   "categoria"
    t.string   "costo"
    t.string   "user_id"
    t.string   "grupo_id"
    t.integer  "countclicks"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "descripcionlarga"
  end

  create_table "respuesta", force: :cascade do |t|
    t.string   "respuesta"
    t.string   "comentario_id"
    t.string   "user_id"
    t.string   "grupo_id"
    t.string   "registro_id"
    t.string   "name_user"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "unirs", force: :cascade do |t|
    t.string   "grupo_id"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
