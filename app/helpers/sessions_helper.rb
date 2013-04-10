module SessionsHelper
  def login(user)
    user.remember_token = SecureRandom.hex(16)
    user.save
    session[:remember_token] = user.remember_token
  end

  def logout
    current_user.remember_token = nil
    current_user.save
    session[:remember_token] = nil
  end

  def current_user
    return nil if session[:remember_token].nil?
    @user ||= User.find_by_remember_token(session[:remember_token])
  end

  def logged_in?
    !current_user.nil?
  end
end