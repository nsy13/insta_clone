class NotificationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :readed_all]

  def index
  end

  def readed_all
    current_user.notifications.where(already: false).update_all(already: true)
    redirect_back(fallback_location: request.referer)
  end
end
