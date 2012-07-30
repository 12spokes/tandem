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

ActiveRecord::Schema.define(:version => 20120730223201) do

  create_table "bikes", :force => true do |t|
    t.integer  "seats"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tandem_contents", :force => true do |t|
    t.string   "type",                                         :null => false
    t.string   "tag",                                          :null => false
    t.text     "content"
    t.text     "details"
    t.string   "link_url"
    t.string   "link_target"
    t.integer  "attachment_id"
    t.string   "attachment_type", :default => "Tandem::Image"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "request_key"
  end

  add_index "tandem_contents", ["request_key", "type", "tag"], :name => "index_tandem_contents_on_request_key_and_type_and_tag", :unique => true
  add_index "tandem_contents", ["request_key"], :name => "index_tandem_contents_on_request_key"

  create_table "tandem_images", :force => true do |t|
    t.string   "resource_file_name"
    t.string   "resource_content_type"
    t.integer  "resource_file_size"
    t.datetime "resource_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tandem_pages", :force => true do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.string   "page_label"
    t.string   "link_label",                     :null => false
    t.string   "layout"
    t.string   "template"
    t.string   "keywords"
    t.string   "description"
    t.string   "slug",                           :null => false
    t.boolean  "is_default",  :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tandem_pages", ["parent_id"], :name => "index_tandem_pages_on_parent_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "widgets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
