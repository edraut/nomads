class Size < ActiveRecord::Base
  belongs_to :size_group
  has_many :item_sizes, :dependent => :destroy
end
