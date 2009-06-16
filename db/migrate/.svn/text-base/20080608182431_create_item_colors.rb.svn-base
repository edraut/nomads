class CreateItemColors < ActiveRecord::Migration
  def self.up
    create_table :item_colors do |t|
      t.integer :item_id
      t.string  :name
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :item_colors
  end
end
