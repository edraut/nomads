class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  
  def clone_attachment
    temp_file = Tempfile.new('attachment')
    temp_file.write(File.open('public' + self.public_filename()).read)
    temp_file.content_type = self.content_type
    temp_file.original_filename = self.filename
    new_attachment = self.class.new(:uploaded_data => temp_file)
    new_attachment.save
    new_attachment
  end
  
end
