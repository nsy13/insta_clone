class NotificationsController < ApplicationController
  def index
    current_user.notifications.where(already: false).update_all(already: true)
  end

  def readed
    current_user.notifications.where(already: false).update_all(already: true)
    redirect_back(fallback_location: request.referer)
  end
end
