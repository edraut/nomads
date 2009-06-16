class CreateItemSizes < ActiveRecord::Migration
  def self.up
    create_table :item_sizes do |t|
      t.integer :item_id
      t.integer :size_id

      t.timestamps
    end
  end

  def self.down
    drop_table :item_sizes
  end
end
