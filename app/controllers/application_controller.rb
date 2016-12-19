class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def verify_admin
    unless current_user.is_admin
      flash[:danger] = t("require_admin")
      redirect_to root_url
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "require_login"
      redirect_to login_url
    end
  end

  def load_user
    @user = User.find_by id: params[:user_id]
    unless @user
      flash[:danger] = t "not_found"
      redirect_to root_url
    end
  end
end
