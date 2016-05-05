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

  def create_client
    @client = NewClient.new(client_params)

    if @client.save
      redirect_to new_user_session_path, flash: { success: "Success" }
    else 
      redirect_to new_user_session_path, flash: { error: @client.errors }
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :mobile, :subject)
  end

  def client_params
    params.require(:new_client).permit(:name, :email, :mobile, :subject, :company, :dni)
  end
end
