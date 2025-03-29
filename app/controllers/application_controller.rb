class ApplicationController < ActionController::Base
  before_action :require_login

  add_flash_types :success, :danger

  helper_method :logged_in?

  private

  def not_authenticated
    redirect_to login_path, danger: 'ログインしてください'
  end

  def logged_in?
    !!session[:user_id]
  end
end