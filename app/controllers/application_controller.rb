class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_forgery_protection
end
