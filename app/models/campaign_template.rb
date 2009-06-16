class CampaignTemplate < ActiveRecord::Base
  has_many :campaign_text_blocks, :as => :container, :dependent => :destroy, :order => 'container_position asc'
end
