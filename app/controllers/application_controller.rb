class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    include SessionsHelper
    helper_method :current_user, :login_user

    def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

    end

    def login_user(user)
	 session[:user_id] = user.id.to_s
  
    end
end
