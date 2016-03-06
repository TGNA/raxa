class ContactController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to contact_path, flash: { success: "Success" }
    else 
      render 'new'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :mobile, :subject)
  end
end
