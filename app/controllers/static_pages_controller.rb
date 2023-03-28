class StaticPagesController < ApplicationController
  def top
    @tips = Tip.order(created_at: :desc).limit(5)
  end
end
