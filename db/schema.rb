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

ActiveRecord::Schema.define(version: 20170224155558) do

  create_table "additionals", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "image",       limit: 255
    t.string   "category",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "antiques", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "subject",     limit: 255
    t.string   "body",        limit: 255
    t.string   "email",       limit: 255
    t.string   "phone",       limit: 255
    t.integer  "is_read",     limit: 4
    t.integer  "property_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "contacts", ["property_id"], name: "index_contacts_on_property_id", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "url_path",    limit: 255
    t.integer  "order",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "property_id", limit: 4
  end

  add_index "images", ["property_id"], name: "index_images_on_property_id", using: :btree

  create_table "inmobiliaria", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "rfc",        limit: 255
    t.string   "phone",      limit: 255
    t.string   "phone2",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "inmobiliaria_users", force: :cascade do |t|
    t.integer "inmobiliaria_id", limit: 4
    t.integer "user_id",         limit: 4
  end

  add_index "inmobiliaria_users", ["inmobiliaria_id"], name: "index_inmobiliaria_users_on_inmobiliarium_id", using: :btree
  add_index "inmobiliaria_users", ["user_id"], name: "index_inmobiliaria_users_on_user_id", using: :btree

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    limit: 255, default: ""
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type",                 limit: 255
    t.text     "body",                 limit: 65535
    t.string   "subject",              limit: 255,   default: ""
    t.integer  "sender_id",            limit: 4
    t.string   "sender_type",          limit: 255
    t.integer  "conversation_id",      limit: 4
    t.boolean  "draft",                              default: false
    t.string   "notification_code",    limit: 255
    t.integer  "notified_object_id",   limit: 4
    t.string   "notified_object_type", limit: 255
    t.string   "attachment",           limit: 255
    t.datetime "updated_at",                                         null: false
    t.datetime "created_at",                                         null: false
    t.boolean  "global",                             default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id", using: :btree
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type", using: :btree
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type", using: :btree
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "rfc",        limit: 255
    t.string   "phone",      limit: 255
    t.string   "phone2",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "operation_id",   limit: 4
    t.integer  "type_id",        limit: 4
    t.integer  "currency_id",    limit: 4
    t.string   "title",          limit: 255
    t.decimal  "price",                        precision: 15, scale: 2
    t.text     "description",    limit: 65535
    t.string   "state",          limit: 255
    t.string   "city",           limit: 255
    t.string   "colony",         limit: 255
    t.string   "street",         limit: 255
    t.string   "number",         limit: 255
    t.integer  "cp",             limit: 4
    t.decimal  "lat",                          precision: 9,  scale: 7
    t.decimal  "lng",                          precision: 9,  scale: 7
    t.string   "address_google", limit: 255
    t.string   "antique",        limit: 255
    t.string   "available",      limit: 255
    t.integer  "park",           limit: 4
    t.integer  "bathdroom",      limit: 4
    t.integer  "halfbath",       limit: 4
    t.integer  "rooms",          limit: 4
    t.integer  "m2",             limit: 4
    t.integer  "totalm",         limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "user_id",        limit: 4
    t.string   "neighborhood",   limit: 255
    t.string   "phone",          limit: 255
    t.string   "phone2",         limit: 255
    t.string   "email",          limit: 255
  end

  add_index "properties", ["currency_id"], name: "index_properties_on_currency_id", using: :btree
  add_index "properties", ["operation_id"], name: "index_properties_on_operation_id", using: :btree
  add_index "properties", ["type_id"], name: "index_properties_on_type_id", using: :btree
  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "property_additionals", force: :cascade do |t|
    t.integer  "additional_id", limit: 4
    t.integer  "property_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "property_additionals", ["additional_id"], name: "index_property_additionals_on_additional_id", using: :btree
  add_index "property_additionals", ["property_id"], name: "index_property_additionals_on_property_id", using: :btree

  create_table "property_images", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.string   "image",       limit: 255
    t.integer  "position",    limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.string   "type_home",   limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.integer  "membership_id",          limit: 4
    t.string   "birth_date",             limit: 255
    t.string   "gender",                 limit: 1
    t.integer  "newsletter",             limit: 4
    t.string   "description",            limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["membership_id"], name: "index_users_on_membership_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "contacts", "properties"
  add_foreign_key "images", "properties"
  add_foreign_key "inmobiliaria_users", "inmobiliaria", column: "inmobiliaria_id"
  add_foreign_key "inmobiliaria_users", "users"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "properties", "currencies"
  add_foreign_key "properties", "operations"
  add_foreign_key "properties", "types"
  add_foreign_key "properties", "users"
  add_foreign_key "property_additionals", "additionals"
  add_foreign_key "property_additionals", "properties"
  add_foreign_key "users", "memberships"
end
