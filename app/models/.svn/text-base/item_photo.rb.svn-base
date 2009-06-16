class ItemPhoto < Attachment
  belongs_to :attachable, :polymorphic => true
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :resize_to => '750x750>',
                 :thumbnails => {:thumb => '80x80>', :medium_thumb => '160x160>'},
                 :path_prefix => 'public/uploaded_images/item_photos'
  validates_as_attachment
end
