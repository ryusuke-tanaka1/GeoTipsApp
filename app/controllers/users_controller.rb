class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :login_user, only: [:show, :index, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]
  before_action :admin_or_correct_user, only: [:edit, :update, :destroy]

  def show
    @tips = @user.tips.order(created_at: :desc).limit(2)
    @all_tips = @user.tips.all
    @all_tips_count = @all_tips.count

    if current_user?(@user)
      # 自分の全てのお気に入りのidを配列にして返す
      favorites = Favorite.where(user_id: current_user.id).pluck(:tip_id)
      # 配列にしたidでTipsを指定してリストを作る
      @favorite_list = Tip.find(favorites)
    end
    
  end

  def index
    @users = User.where(admin: false).paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] ="ユーザー登録しました"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "アカウント情報を修正しました。"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "アカウントを削除しました。"
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
