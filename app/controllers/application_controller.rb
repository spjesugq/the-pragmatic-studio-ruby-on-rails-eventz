class ApplicationController < ActionController::Base
private
  helper_method :current_user
  helper_method :current_user?

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?(user)
    current_user == user
  end

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to(new_session_url, alert: "Please sign in first!")
    end
  end

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to(events_url) unless current_user?(@user)
  end
end
