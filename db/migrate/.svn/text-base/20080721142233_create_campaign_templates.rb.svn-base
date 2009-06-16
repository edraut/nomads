class CreateCampaignTemplates < ActiveRecord::Migration
  def self.up
    create_table :campaign_templates do |t|
      t.string :name
      t.string :partial

      t.timestamps
    end
  end

  def self.down
    drop_table :campaign_templates
  end
end
