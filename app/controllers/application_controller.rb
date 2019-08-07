class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include ApplicationHelper
  include DeviseHelper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :city, :country, :username, :about ])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :phone, :city, :country, :about, :avatar, :username, :about, :email, :password, :password_confirmation, :current_password) }
  end
end