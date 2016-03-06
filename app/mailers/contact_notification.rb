class ContactNotification < ApplicationMailer
  default from: 'servidor@raxadistribuciones.com'

  def send_contact_email(contact)
    @contact = contact
    mail(to: ["oscarbc1996@gmail.com"], subject: 'Nuevo formulario de contacto lleno' )
  end
end
