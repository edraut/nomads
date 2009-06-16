class Fabric < ActiveRecord::Base
  has_many :item_fabrics, :dependent => :destroy
end
