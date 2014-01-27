module ApplicationHelper

  def auth
    "<input value=\"hidden\" name=\"authenticity_token\" value=\"#{form_authenticity_token}\">".html_safe
  end
end
