class Item < ActiveRecord::Base
  include Search
  has_many :item_colors, :dependent => :destroy, :order => :position
  has_many :item_color_photos, :through => :item_colors
  has_many :item_sizes, :dependent => :destroy
  has_many :sizes, :through => :item_sizes, :order => :position
  has_many :attachments, :as => :attachable, :dependent => :destroy
  has_many :item_photos, :as => :attachable, :dependent => :destroy
  has_many :item_fabrics, :dependent => :destroy
  has_many :item_browse_tags, :dependent => :destroy
  has_many :browse_tags, :through => :item_browse_tags
  belongs_to :brand
  composed_of :price, :class_name => 'Money', :mapping => [%w(price cents)]
  composed_of :sale_price, :class_name => 'Money', :mapping => [%w(sale_price cents)]
  
  def item_color_photo
    self.item_colors.each do |item_color|
      if !(item_color.item_color_photos.empty?) and (@item_color_photo = item_color.item_color_photos.first)
        break
      end
    end
    @item_color_photo ||= nil
  end

  def self.search_columns
    ['name','description']
  end
  
end
