class SessionsController < ApplicationController
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :google_create
  before_action :verify_g_csrf_token, only: :google_create

  def new
  end
  # 通常のログイン
  def create
    user = User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      login user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = "認証に失敗しました。"
      render :new
    end
  end

  # Googleログインの場合
  def google_create
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: '80642622284-6kqq3sqv2usj1v152msmhqg1vn5kc1bb.apps.googleusercontent.com')
    unless user = User.find_by(email: payload['email'])
      pass = SecureRandom.urlsafe_base64
      user = User.create(name: payload['name'], email: payload['email'], password: pass, login_by_google: true)
    end
    login user
    remember(user)
    flash[:success] ="ログインしました"
    redirect_to user
  end

  def destroy
    logout if logged_in?
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end

  private
  def verify_g_csrf_token
    if cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank? || cookies["g_csrf_token"] != params[:g_csrf_token]
      flash[:success] = "不正なアクセスです"
      redirect_to root_url
    end
  end
end
