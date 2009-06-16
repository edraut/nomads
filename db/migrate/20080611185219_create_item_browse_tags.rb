class CreateItemBrowseTags < ActiveRecord::Migration
  def self.up
    create_table :item_browse_tags do |t|
      t.integer :item_id
      t.integer :browse_tag_id
      t.timestamps
    end
  end

  def self.down
    drop_table :item_browse_tags
  end
end
