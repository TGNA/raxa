class Order < ActiveRecord::Base
  belongs_to :order_status
  belongs_to :user
  has_many :order_items
  before_create :set_order_status
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
    self.order_status_id = 2
    self.save
    OrderNotifier.send_cart_email(self).deliver_now
  end
  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_info
    self[:subtotal] = subtotal
    self[:tax] = tax
    self[:recargo] = recargo
    self[:total] = total
  end

end