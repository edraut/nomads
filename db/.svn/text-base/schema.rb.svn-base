# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080721142441) do

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "type"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "browse_tags", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_templates", :force => true do |t|
    t.string   "name"
    t.string   "partial"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_text_blocks", :force => true do |t|
    t.integer  "container_id"
    t.string   "container_type"
    t.integer  "container_position"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.integer  "campaign_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_browse_tags", :force => true do |t|
    t.integer  "item_id"
    t.integer  "browse_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_colors", :force => true do |t|
    t.integer  "item_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_fabrics", :force => true do |t|
    t.integer  "item_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_sizes", :force => true do |t|
    t.integer  "item_id"
    t.integer  "size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.integer  "price"
    t.boolean  "home_page_feature"
    t.integer  "sale_price"
    t.boolean  "on_sale"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "body"
    t.string   "partial"
    t.integer  "position"
    t.boolean  "dirty",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "size_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", :force => true do |t|
    t.string   "name"
    t.integer  "size_group_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "user_name"
    t.string   "type"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
