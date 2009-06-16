class CreateCampaignTextBlocks < ActiveRecord::Migration
  def self.up
    create_table :campaign_text_blocks do |t|
      t.integer :container_id
      t.string :container_type
      t.integer :container_position
      t.string :name
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :campaign_text_blocks
  end
end
