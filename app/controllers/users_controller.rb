class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :delete]

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
    else
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
    def set_user
      @user = User.find(:id)
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
