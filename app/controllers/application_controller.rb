class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  def user_not_authorized
    flash[:alert] = "Oops! It looks like you're not authorized to edit or delete this review. Only the author can make changes."
    redirect_to(request.referer || root_path)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, user_family_type: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, user_family_type: []])
  end
end
