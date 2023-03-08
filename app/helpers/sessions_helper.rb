module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
