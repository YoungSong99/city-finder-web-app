class ContactMailer < ApplicationMailer
  def contact_email(contact_params)
    @name = contact_params[:name]
    @message = contact_params[:message]
    @sender_email = contact_params[:email]
    @subject = contact_params[:category]


    mail(
      to: 'cityfinder.online@gmail.com',
      from: @sender_email,
      subject: "#{@subject} from #{@name}"
    )
  end
end
