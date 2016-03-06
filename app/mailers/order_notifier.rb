class OrderNotifier < ApplicationMailer
  default from: 'servidor@raxadistribuciones.com'

  def send_cart_email(order)
    @order = order
    @order_items = @order.order_items
    mail(to: ["oscarbc1996@gmail.com"], subject: 'Nueva compra realizada' )
  end
end
