class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      #InfoMailer.form_contact(@contact).deliver
      redirect_to root_path, notice: "se ha enviado tu mensaje de contacto"
    else
      redirect_to root_path, notice: "hubo problemas al enviar el mensaje de contacto"
    end
  end

  private
  def contact_params
      params.require(:contact).permit(:email, :title, :description)
  end
end
