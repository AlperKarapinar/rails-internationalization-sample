class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale, :set_user_timezone
  
  def set_locale
    I18n.locale = params[:locale] || current_user.try(:locale) || extract_locale_from_accept_language_header
  end

private

  def set_user_timezone
    Time.zone = current_user.try(:time_zone)
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[en|tr]{2}/).first || I18n.default_locale
  end
  
end
