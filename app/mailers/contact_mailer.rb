class ContactMailer < ActionMailer::Base
  add_template_helper(EmailHelper)
  default from: "shprittzmailer@gmail.com"

  def contact_message(name, email, message)
    @name = name
    @email = email
    @message = message

    mail to: "shprittzmailer@gmail.com", subject: "Message from some user"
  end
end
