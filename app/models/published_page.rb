class PublishedPage < Page
  def pending_version
    PendingPage.find(:first, :conditions => {:name => self.name})
  end
end