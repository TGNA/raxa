class OrderNotifier < ApplicationMailer
  default from: 'servidor@raxadistribuciones.com'

  def send_cart_email(order)
    @order = order
    @order_items = @order.order_items
    @user = @order.user
    mail(to: [@order.email, @order.email_vendedor, "contacto@raxadistribuciones.com"], subject: 'Nueva compra realizada' )
  end
end
