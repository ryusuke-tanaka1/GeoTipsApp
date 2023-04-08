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
      tips = Tip.where(country: params[:tips_condition][:country]) if params[:tips_condition].present? && params[:tips_condition][:country].present?
      tips = tips.where('tips_type LIKE ?', "%#{params[:tips_condition][:tips_type]}%") if params[:tips_condition].present? && params[:tips_condition][:tips_type].present?
      tips = tips.where('tips_content LIKE ?', "%#{params[:tips_condition][:tips_content]}%") if params[:tips_condition].present? && params[:tips_condition][:tips_content].present?
      @tips = tips.paginate(page: params[:page]).order(created_at: :desc)
    else
      @tips = @user.tips.paginate(page: params[:page]).order(created_at: :desc)
    end
  end

  # 全Tips一覧
  def tips_index
    if params[:tips_condition].present?
      tips = Tip.all
      tips = tips.where(country: params[:tips_condition][:country]) if params[:tips_condition][:country].present?
      tips = tips.where('tips_type LIKE ?', "%#{params[:tips_condition][:tips_type]}%") if params[:tips_condition][:tips_type].present?
      tips = tips.where('tips_content LIKE ?', "%#{params[:tips_condition][:tips_content]}%") if params[:tips_condition][:tips_content].present?
      # favoritesに自分がお気に入りに登録したTipsのidを格納、pluckで配列型に変換、keyは:tip_id
      if params[:tips_condition][:user_favorite].present?
        favorites = Favorite.where(user_id: params[:tips_condition][:user_favorite]).pluck(:tip_id)
        tips = tips.where(id: favorites)
      end
      @tips = tips.paginate(page: params[:page]).order(created_at: :desc)
    else
      @tips = Tip.all.paginate(page: params[:page]).order(created_at: :desc)
    end
  end

  def new
    @tip = @user.tips.new
  end

  def create
    @tip = @user.tips.new
    tp = tip_params
    tp[:street_view] = URI.extract(tp[:street_view])[0]
    if @tip.update_attributes(tp)
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
    etp = edit_tip_params
    etp[:street_view] = URI.extract(etp[:street_view], ["https"])[0]
    if etp[:remove_img] == "1"
      @tip.remove_img!
      @tip.save
    end
    if @tip.update_attributes(etp)
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
      params.require(:user).permit(:user_favorite, tips: [:tips_type, :country, :tips_content, :street_view, :img, :user_favorite])[:tips]
    end

    def edit_tip_params
      params.require(:tip).permit(:tips_type, :country, :tips_content, :street_view, :img, :remove_img)
    end

    def set_user_id
      redirect_to root_url unless @user = User.find_by(id: params[:user_id])
    end
end
