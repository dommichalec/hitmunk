module ApplicationHelper

  def full_title(title)
    base_title = "#{$SITE_TITLE}"
    title.blank? ? base_title : "#{title}" + " | " + base_title
  end
end
