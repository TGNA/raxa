class ContactNotification < ApplicationMailer
  default from: 'servidor@raxadistribuciones.com'

  def send_contact_email(contact)
    @contact = contact
    mail(to: [contact.email, "contacto@raxadistribuciones.com"], subject: 'Nuevo formulario de contacto lleno' )
  end
end
