class CreateCampaigns < ActiveRecord::Migration
  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.references :campaign_template

      t.timestamps
    end
  end

  def self.down
    drop_table :campaigns
  end
end
