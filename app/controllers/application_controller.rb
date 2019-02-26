class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  def redirect_home
    redirect_to admin_root_path and return if current_user.admin?
    redirect_to citizen_path(current_user.citizen)
  end
end
