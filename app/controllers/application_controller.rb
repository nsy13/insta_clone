class ApplicationController < ActionController::Base
  include ApplicationHelper
  include NotificationsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name,
                                                       :user_name,
                                                       :self_introduction,
                                                       :website,
                                                       :gender,
                                                       :tel,])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name,
                                                              :user_name,
                                                              :self_introduction,
                                                              :website,
                                                              :gender,
                                                              :tel,])
  end
end
