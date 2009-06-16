class PendingPage < Page
  def published_version
    PublishedPage.find(:first, :conditions => {:name => self.name})
  end
    
end