class Product < ActiveRecord::Base
  has_many :order_items
  belongs_to :product_category, class_name: "ProductCategory", foreign_key: "cat_id"
  paginates_per 15

  def price(tarifa)
    return self.tarifa_1 if tarifa == 1
    return self.tarifa_2 if tarifa == 2
    return self.tarifa_3 if tarifa == 3
    return self.tarifa_4 if tarifa == 4
    return self.tarifa_5 if tarifa == 5
  end
end