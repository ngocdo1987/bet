class ContactMailer < ActionMailer::Base
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.send_contact_email.subject
  #
  def send_contact_email(contact_form_params)
    @name = contact_form_params['name']
    @email = contact_form_params['email']
    @phone = contact_form_params['phone']
    @message = contact_form_params['message']

    mail from: @email, to: 'nguyenanhngoc.do@gmail.com', subject: "Cookcook contact #{@name} #{@email}"
  end
end
