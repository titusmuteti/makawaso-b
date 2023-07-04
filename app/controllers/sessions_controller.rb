class SessionsController < ApplicationController
    before_action :authenticate_user!, except: :create

    def create
      user = Client.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :created
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end
  
    def destroy
      if session[:user_id]
        session.delete(:user_id)
        head :no_content
      else
        render json: { error: "You must be logged in" }, status: :unauthorized
      end
    end
  
    private
  
    def authenticate_user!
        unless user_signed_in?
          render json: { error: "Not authorized" }, status: :unauthorized
        end
    end
end
  