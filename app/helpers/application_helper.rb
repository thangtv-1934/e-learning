module ApplicationHelper
  def full_title page_title = ""
    base_title = I18n.t("title")
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def get_stt page, per_page
    return 1 if page == 0
    (page - 1) * per_page + 1
  end
end
