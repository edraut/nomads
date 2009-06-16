class ItemColor < ActiveRecord::Base
  belongs_to :item
  has_many :item_color_photos, :as => :attachable, :dependent => :destroy
end
