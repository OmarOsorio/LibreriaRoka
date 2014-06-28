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

ActiveRecord::Schema.define(version: 20140611181644) do

  create_table "books", force: true do |t|
    t.string   "isbn"
    t.string   "titulo"
    t.string   "autor"
    t.string   "editorial"
    t.decimal  "precio"
    t.integer  "existencias"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "email"
    t.string   "direccion"
    t.string   "rfc"
    t.string   "facebook"
    t.string   "linkedln"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detail_orders", force: true do |t|
    t.integer  "order_id"
    t.integer  "book_id"
    t.integer  "cantidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detail_sales", force: true do |t|
    t.integer  "sale_id"
    t.integer  "book_id"
    t.integer  "cantidad"
    t.decimal  "precio"
    t.integer  "descuento"
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "nombre"
    t.string   "usuario"
    t.string   "password"
    t.string   "email"
    t.string   "direccion"
    t.string   "telefono"
    t.integer  "meta"
    t.boolean  "gerente"
    t.boolean  "vendedor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "employee_id"
    t.integer  "client_id"
    t.datetime "fechaPedido"
    t.datetime "fechaParaEntregar"
    t.datetime "fechaEntrega"
    t.string   "direccion"
    t.boolean  "cancelado"
    t.boolean  "en_espera"
    t.boolean  "entregado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promotions", force: true do |t|
    t.integer  "client_id"
    t.integer  "employee_id"
    t.date     "fecha"
    t.string   "medioComunicacion"
    t.text     "acuerdo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "email"
    t.string   "direccion"
    t.string   "tipo_libro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "client_id"
    t.datetime "fecha_venta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
