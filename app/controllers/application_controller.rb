class ApplicationController < ActionController::Base
  include CommonActions
  include NotificationsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :user_name])
  end
end
