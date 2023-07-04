class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    # before_action :authenticate_user
  
    private
  
    def authorize
      render json: { error: "Not authorized" }, status: :unauthorized unless logged_in?
    end
  
    def logged_in?
      !!current_user
    end
  
    def current_user
        @current_user ||= Client.find_by(id: session[:user_id]) if session[:user_id].present?
    end
  end
  