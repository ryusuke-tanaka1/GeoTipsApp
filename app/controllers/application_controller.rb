class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    def admin_user
      unless current_user.admin?
        flash[:danger] = "権限がありません。"
        redirect_to root_url
      end
    end

    def correct_user
      redirect_to root_url unless current_user?(@user)
    end
end
