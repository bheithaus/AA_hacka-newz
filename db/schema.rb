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

ActiveRecord::Schema.define(:version => 20130410005556) do

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentor_id"
    t.integer  "link_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "parent_id"
  end

  add_index "comments", ["commentor_id", "link_id"], :name => "index_comments_on_commentor_id_and_link_id"

  create_table "link_votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "link_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "link_votes", ["user_id", "link_id"], :name => "index_link_votes_on_user_id_and_link_id"

  create_table "links", :force => true do |t|
    t.string   "url"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "links", ["author_id"], :name => "index_links_on_author_id"

  create_table "relations", :force => true do |t|
    t.integer  "ancestor_id"
    t.integer  "descendant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "password"
    t.string   "remember_token"
  end

  add_index "users", ["name"], :name => "index_users_on_name"

end
