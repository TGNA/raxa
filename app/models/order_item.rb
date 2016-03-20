class OrderItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price(self.tarifa)*(1-(product.descuento.to_f/100))
    end
  end

  def total_price
    unit_price * quantity
  end

  private
  def product_present
    if product.nil?
      errors.add(:product, "es no valido o no esta activo.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "pedido no valido.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    total = quantity * self[:unit_price]
    self[:total_price] = total
  end
end
