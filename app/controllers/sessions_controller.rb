class SessionsController < ApplicationController
    # skip_before_action :authorize, only: :create

    def create
    byebug
    user = Client.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render json: user, status: :created
    else
        render json: {error: "Invalid username or password"}, status: :unauthorized
    end
end

def destroy
    if session[:user_id]
    session.delete :user_id
    head :no_content
    else
    render json: {error: "You must be logged in to access this content"}, status: :unauthorized
    
end
