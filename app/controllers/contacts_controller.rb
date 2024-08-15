class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    non_sensitive_data = params.require(:contact).permit(:category, :message)

    session[:contact_data] = {
      name: params[:contact][:name],
      email: params[:contact][:email]
    }

    @contact = Contact.new(non_sensitive_data.merge(session[:contact_data]))

    if @contact.save
      session.delete(:contact_data)
      flash[:notice] = "We're excited to hear from you. Let's keep making CityFinder even better together!"
      redirect_to new_contact_path
    else
      flash[:alert] = "Oh no! Something went wrong with your message. Please give it another go—we're here to help you find the perfect city!"
      render :new
    end
  end
end
