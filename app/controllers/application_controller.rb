class ApplicationController < ActionController::Base
  before_action :authenticate_login
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  private
  def authenticate_login
    if not current_user
      redirect_to main_path
    end
  end
end
