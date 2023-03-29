class TipsController < ApplicationController
  before_action :set_user_id, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  before_action :admin_or_correct_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_countries, only: [:index, :tips_index, :new, :create, :edit, :update]

  def show
    @tip = Tip.find(params[:id])
  end

  # 特定のユーザーのTips一覧
  def index
    if params[:tips_condition]
      conditions = { user_id: @user.id }
      conditions[:country] = params[:tips_condition][:country] if params[:tips_condition].present? && params[:tips_condition][:country].present?
      conditions[:tips_type] = params[:tips_condition][:tips_type] if params[:tips_condition].present? && params[:tips_condition][:tips_type].present?
      conditions[:tips_content] = params[:tips_condition][:tips_content] if params[:tips_condition].present? && params[:tips_condition][:tips_content].present?
      @tips = Tip.where(conditions).paginate(page: params[:page])
    else
      @tips = @user.tips.paginate(page: params[:page])
    end
  end

  # 全Tips一覧
  def tips_index
    if params[:tips_condition]
      conditions = {}
      conditions[:country] = params[:tips_condition][:country] if params[:tips_condition].present? && params[:tips_condition][:country].present?
      conditions[:tips_type] = params[:tips_condition][:tips_type] if params[:tips_condition].present? && params[:tips_condition][:tips_type].present?
      conditions[:tips_content] = params[:tips_condition][:tips_content] if params[:tips_condition].present? && params[:tips_condition][:tips_content].present?
      @tips = Tip.where(conditions).paginate(page: params[:page])
    else
      @tips = Tip.all.paginate(page: params[:page])
    end
  end

  def new
    @tip = @user.tips.new
  end

  def create
    @tip = @user.tips.new
    @tip.tips_type = tip_params[:tips_type]
    @tip.country = tip_params[:country]
    @tip.tips_content = tip_params[:tips_content]
    @tip.street_view = URI.extract(tip_params[:street_view], ["https"])[0]
    if @tip.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
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
      params.require(:user).permit(tips: [:tips_type, :country, :tips_content, :street_view])[:tips]
    end

    def edit_tip_params
      params.require(:tip).permit(:tips_type, :country, :tips_content, :street_view)
    end

    def set_user_id
      redirect_to root_url unless @user = User.find_by(id: params[:user_id])
    end
end
