class ContactsController < ApplicationController
  def new
  end

  def create
    @name = params[:contact_form][:name]
    @email = params[:contact_form][:email]
    @category = params[:contact_form][:category]
    @message = params[:contact_form][:message]

    NotifierMailer.simple_message(@name, @message, @email, @category).deliver_now


    flash[:notice] = "We're excited to hear from you. Let's keep making CityFinder even better together!"
    redirect_to new_contact_path
  end
end
