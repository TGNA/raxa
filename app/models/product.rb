class Product < ActiveRecord::Base
  has_many :order_items
  belongs_to :product_category, class_name: "ProductCategory", foreign_key: "cat_id"
  paginates_per 15

  validates_presence_of(:ref_1, :ref_2, :description, :cat_id, :iva, :recargo_eq, :ean, :unidad_caja, :foto, :tarifa_1, :tarifa_2, :tarifa_3, :tarifa_4, :tarifa_5, :activo, :descuento)

  def price(tarifa)
    return self.tarifa_1 if tarifa == 1
    return self.tarifa_2 if tarifa == 2
    return self.tarifa_3 if tarifa == 3
    return self.tarifa_4 if tarifa == 4
    return self.tarifa_5 if tarifa == 5
  end

  def self.search(search)
    where("description LIKE ?", "%#{search}%")
  end
end