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
    tip_params[:street_view] = URI.extract(tip_params[:street_view], ["https"])[0]
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
    @tip.tips_type = edit_tip_params[:tips_type]
    @tip.country = edit_tip_params[:country]
    @tip.tips_content = edit_tip_params[:tips_content]
    @tip.street_view = URI.extract(edit_tip_params[:street_view], ["https"])[0]
    if @tip.save
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
      params.require(:tips).permit(:tips_type, :country, :tips_content, :street_view)
    end

    def edit_tip_params
      params.require(:tip).permit(:tips_type, :country, :tips_content, :street_view)
    end
end
