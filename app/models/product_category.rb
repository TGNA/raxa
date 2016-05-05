class ProductCategory < ActiveRecord::Base
  has_many :products
  validates_presence_of(:name, :s_id)
end
