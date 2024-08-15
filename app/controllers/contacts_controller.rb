class ContactsController < ApplicationController
  def new
  end

  def create
    contact_params = params.require(:contact).permit(:name, :email, :message, :subject)

    ContactMailer.contact_email(contact_params).deliver_now

    flash[:notice] = 'Your message has been sent.'
    redirect_to new_contact_path
  end
end
