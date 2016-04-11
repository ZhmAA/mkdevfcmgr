module ApplicationHelper
  def current_location(location)
    I18n.locale == location
  end
end
