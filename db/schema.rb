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

ActiveRecord::Schema.define(:version => 20130926114128) do

  create_table "clients", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "entreprise"
    t.string   "telephone"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "entreprise"
    t.string   "lieu"
    t.string   "telephone"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "messages", ["email"], :name => "index_messages_on_email", :unique => true

  create_table "projects", :force => true do |t|
    t.integer  "client_id"
    t.string   "question1"
    t.string   "question2"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "question3"
    t.string   "question4"
    t.string   "question5"
    t.string   "question6"
    t.string   "question7"
    t.string   "question8"
    t.string   "question9"
    t.string   "question10"
    t.string   "question11"
    t.string   "question12"
    t.string   "question13"
    t.string   "question14"
    t.string   "question15"
    t.string   "question16"
    t.string   "question17"
    t.string   "question18"
    t.string   "question19"
    t.string   "question20"
    t.string   "question21"
    t.string   "question22"
    t.string   "question23"
    t.string   "question24"
    t.string   "question25"
    t.string   "question26"
    t.string   "question27"
    t.string   "question28"
    t.string   "question29"
    t.string   "question30"
  end

end
