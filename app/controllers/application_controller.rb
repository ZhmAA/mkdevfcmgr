class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login, :set_locale

  private
  
  def not_authenticated
    redirect_to login_url, :alert => "Чтобы просмотреть эту страницу нужно зарегистрироваться!"
  end
  
  def set_locale
    I18n.locale = if current_user
      current_user.location
    else
      http_accept_language.compatible_language_from(I18n.available_locales)
    end
  end

end
