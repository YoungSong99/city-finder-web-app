class NotifierMailer < ApplicationMailer
  default to: ENV['EMAIL'],
          from: ENV['EMAIL']

  def simple_message(name, message, sender_email, category)
    mail(
      "reply-to": email_address_with_name(sender_email, "#{name}"),
      subject: category,
      body: message
    )
  end
end