class CampaignImage < Attachment
  belongs_to :attachable, :polymorphic => true
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :resize_to => '590x590>',
                 :thumbnails => {:thumb => '80x80>', :medium_thumb => '190x190>'},
                 :path_prefix => 'public/uploaded_images/campaign_images'
  validates_as_attachment
end
  