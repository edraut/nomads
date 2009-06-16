class Campaign < ActiveRecord::Base
  belongs_to :campaign_template
  has_many :campaign_text_blocks, :as => :container, :dependent => :destroy, :order => 'container_position asc'
  has_many :campaign_images, :as => :attachable, :dependent => :destroy
  
end
