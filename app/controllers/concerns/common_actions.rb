require 'active_support/concern'

module CommonActions
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in_user
  end

  def logged_in_user
    unless user_signed_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end
end