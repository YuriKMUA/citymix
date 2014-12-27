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

ActiveRecord::Schema.define(version: 20141219135839) do

  create_table "additional_photos", force: true do |t|
    t.integer  "kod_id"
    t.string   "cartikul_add"
    t.string   "cphoto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baskets", force: true do |t|
    t.string   "cartikul"
    t.string   "ctxt"
    t.text     "ccontent"
    t.integer  "size_id"
    t.string   "remember_token"
    t.integer  "number"
    t.integer  "nprice"
    t.integer  "nsum"
    t.integer  "color_id"
    t.integer  "discount"
    t.string   "promo_kod"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "status_delivery_id"
    t.integer  "user_id"
    t.string   "avatar"
  end

  create_table "brands", force: true do |t|
    t.string   "ctxt"
    t.integer  "kategories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
  end

  create_table "colors", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ncheck"
  end

  create_table "conditions", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connections", force: true do |t|
    t.integer  "product_id"
    t.integer  "color_id"
    t.integer  "size_id"
    t.integer  "number"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cartikul"
  end

  create_table "connectionsizes", id: false, force: true do |t|
    t.integer "connection_id"
    t.integer "size_id"
    t.integer "number"
  end

  create_table "fasteners", force: true do |t|
    t.string   "ctxt",       limit: nil
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filters", force: true do |t|
    t.string   "ctxt"
    t.boolean  "lvisible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flt_brand_relations", force: true do |t|
    t.string   "ctxt"
    t.integer  "brands_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flt_kat_relations", id: false, force: true do |t|
    t.integer  "filter_id"
    t.integer  "kategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_tovs", force: true do |t|
    t.string   "ctxt"
    t.boolean  "lvisible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kategories", force: true do |t|
    t.string   "ctxt_ua"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lvisible"
    t.string   "ccatalog"
    t.integer  "group_tov_id"
    t.string   "ctxt_rus"
  end

  create_table "manufacturers", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mens_wears", force: true do |t|
    t.string   "cedrpou"
    t.string   "ctxt"
    t.text     "ccontent"
    t.string   "csize"
    t.string   "ccolor"
    t.float    "nprice"
    t.boolean  "lvisible"
    t.integer  "nshtrih_kod"
    t.string   "cartikul"
    t.boolean  "ldelivery"
    t.integer  "nprice_delivery"
    t.integer  "kategories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cphoto"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["group_id"], name: "index_microposts_on_group_id"
  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "necks", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "declaration_id"
    t.string   "oplata"
    t.string   "dostavka"
    t.string   "ctxt"
    t.text     "ccontent"
    t.integer  "user_id"
    t.integer  "status_delivery_id"
    t.integer  "nsum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.boolean  "llatest"
    t.integer  "neck_id"
    t.string   "cedrpou"
    t.string   "ctxt"
    t.text     "ccontent"
    t.float    "nprice"
    t.boolean  "lvisible"
    t.integer  "nshtrih_kod"
    t.string   "cartikul"
    t.boolean  "ldelivery"
    t.integer  "nprice_delivery"
    t.integer  "kategories_id"
    t.integer  "group_tov_id"
    t.integer  "season_id"
    t.integer  "manufacturer_id"
    t.integer  "condition_id"
    t.integer  "suplier_id"
    t.integer  "npurchase_price"
    t.integer  "nold_price"
    t.string   "avatar"
    t.integer  "type_id"
    t.integer  "brand_id"
    t.integer  "fastener_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "availability"
  end

  add_index "products", ["cartikul"], name: "index_products_on_cartikul", unique: true
  add_index "products", ["cedrpou"], name: "index_products_on_cedrpou", unique: true

  create_table "products_colors", id: false, force: true do |t|
    t.string  "cphoto",               limit: nil
    t.integer "temporary_product_id"
    t.integer "color_id"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "seasons", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kategories_id"
  end

  create_table "status_deliveries", force: true do |t|
    t.string   "ctxt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "storages", force: true do |t|
    t.string   "cartikul"
    t.integer  "number"
    t.string   "ctxt"
    t.string   "cartikul_add"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "temporary_products" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "temporary_types", force: true do |t|
    t.string   "ctxt"
    t.integer  "kategories_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string  "ctxt"
    t.integer "kategories_id"
  end

  create_table "users", force: true do |t|
    t.string   "phone",           limit: nil
    t.string   "name"
    t.string   "edrpou"
    t.string   "adress"
    t.string   "menedger"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "admin"
    t.string   "cpochta"
    t.string   "city"
    t.string   "last_name"
  end

end
