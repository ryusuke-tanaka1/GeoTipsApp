class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login @user
      redirect_to @user
    else
    end
  end

  def edit
  end

  def update
    @user.update_attributes!(user_params)
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(:id)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
