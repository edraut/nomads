class CreateBrowseTags < ActiveRecord::Migration
  def self.up
    create_table :browse_tags do |t|
      t.string :name
      t.integer :parent_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :browse_tags
  end
end
