class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  before_save :update_info

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def tax
    subtotal*0.21
  end

  def recargo
    (subtotal + tax)*0.052
  end

  def total
    (subtotal + tax + recargo)
  end

  def checkout
    OrderNotifier.send_cart_email(self).deliver_now
  end
  private

  def update_info
    self[:subtotal] = subtotal
    self[:tax] = tax
    self[:recargo] = recargo
    self[:total] = total
  end

end