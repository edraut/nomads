class PageMainPhoto < Attachment
  belongs_to :attachable, :polymorphic => true
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :max_size => 500.kilobytes,
                 :resize_to => '750x750>',
                 :path_prefix => 'public/uploaded_images/page_main_photos'
  validates_as_attachment
end
