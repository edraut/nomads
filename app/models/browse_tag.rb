class BrowseTag < ActiveRecord::Base
  acts_as_tree :order => 'position'
  has_many :item_browse_tags
  
  def self.list_in_order
    self.recursive_find(1)
  end
  
  def self.recursive_find(id)
    this_list = [self.find(id)]
    these_children = this_list.first.children.collect{|child| self.recursive_find(child.id)}.flatten
    this_list += these_children
    this_list
  end
  
  def me_and_my_descendants
    [self] + self.children.collect{|c| c.me_and_my_descendants}.flatten
  end
  
end
