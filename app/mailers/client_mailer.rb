class ClientMailer < ApplicationMailer
  default from: 'servidor@raxadistribuciones.com'

  def send_client_email(client)
    @client = client
    mail(to: [client.email, "contacto@raxadistribuciones.com"], subject: 'Nuevo formulario de cliente lleno' )
  end
end
