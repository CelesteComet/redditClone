class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_moderator
    if !(current_user && current_user.id = params[:id])
      redirect_to new_session_url
    end
  end
end
