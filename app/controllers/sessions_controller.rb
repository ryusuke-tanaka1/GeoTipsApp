class SessionsController < ApplicationController
  require 'googleauth/id_tokens/verifier'

  protect_from_forgery except: :create
  before_action :verify_g_csrf_token, only: :google_create

  def new
  end
  # 通常のログイン
  def create
    user = User.find_by(email: params[:session][:email].downcase )
    if user && user.authenticate(params[:session][:password])
      login user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash.now[:danger] = "認証に失敗しました。"
      render :new
    end
  end

  # Googleログインの場合
  def google_create
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: 'YOUR GOOGLE CLIENT ID')
    # パスワード設定してないから失敗するはず。
    user = User.find_or_create_by(email: payload['email'])
    login user
    remember(user)
    flash[:success] ="ログインしました"
    redirect_to root_url
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
