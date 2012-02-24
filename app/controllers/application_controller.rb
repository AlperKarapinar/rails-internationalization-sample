class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  
  def set_locale
    I18n.locale = params[:locale] || current_user.try(:locale) || extract_locale_from_accept_language_header
  end

private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[EN|TR]{2}/).first || I18n.default_locale
  end
  
end
