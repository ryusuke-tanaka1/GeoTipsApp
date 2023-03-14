class TipsController < ApplicationController
  def show
    @tip = Tip.find(params[:id])
  end

  def index
  end

  def tips_index
    @tips = Tip.all
  end

  def new
    @tip = Tip.new
  end

  def create
    @user = User.find(params[:user_id])
    @tip = @user.tips.new(tip_params)
    if @tip.save
      redirect_to user_tip_path(@user, @tip)
    else
      flash.now[:danger] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @tip = Tip.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @tip = Tip.find(params[:id])
    if @tip.update_attributes(edit_tip_params)
      flash[:success] = "Tipsを編集しました。"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @tip = Tip.find(params[:id])
    @tip.destroy
    flash[:success] = "Tipsを削除しました。"
    redirect_to @user
  end

  private
    def tip_params
      params.require(:tips).permit(:tips_type, :country, :tips_content)
    end

    def edit_tip_params
      params.require(:tip).permit(:tips_type, :country, :tips_content)
    end
end
