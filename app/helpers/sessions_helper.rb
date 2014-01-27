module SessionsHelper
  def current_user
    return nil if session[:token].nil?
    @current_user = User.find_by_session_token(session[:token])
  end

  def signin(user)
    session[:token] = user.session_token
  end

  def signout(user)
    user.reset_session_token!
    session[:token] = nil
  end

  def ensure_current_user
    redirect_to login_url if current_user.nil?
  end
end
