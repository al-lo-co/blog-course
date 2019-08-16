class InfoMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.info_mailer.form_contact.subject
  #
  def form_contact(contacto)
  	@correo = Contact.find(contacto.id)
    @greeting = "Hi #{contacto.email}"

    mail to: "to@example.org", subject: contacto.email
  end
end
