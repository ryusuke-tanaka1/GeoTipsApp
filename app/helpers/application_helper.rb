module ApplicationHelper
  def create_title(page_title = "")
    app_title = "GeoTips"
    if page_title.blank?
      app_title
    else
      page_title + "|" + app_title
    end
  end
end
