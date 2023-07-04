class ClientsController < ApplicationController
            # skip_before_action :authorize, only: :create
            rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

            def index
                clients = Client.all
                render json: clients, include: [:employees],  status: :ok
            end
        
            def show
                client = Client.find_by_id(session[:client_id])
                if client
                    render json: client, status: :ok
                else
                    render json: {error: "You must be logged in to access this content"}, status: :unauthorized
                end
        
            end
        
            def create
                byebug
                client = Client.create!(client_params)
                if client.save
                # UserNotifierMailer.send_signup_email(@user).deliver
                    session[:client_id] = client.id
                    render json: client, status: :created
                else
                    render :action => 'new'
                end
        
            end
        
            def update
                client = Client.find_by(params[:id])
                client.update!(client_params)
                render json: client , status: :ok
            end
        
            def destroy
                client = Client.find(params[:id])
                client.destroy
                render json: {message: "User deleted"}, status: :ok
            end
        
            private
        
            def client_params
                params.permit(:first_name, :last_name, :email, :phone_number)
            end
        
            def record_invalid
                render json: {error: "Invalid user"}, status: :unprocessable_entity
            end
        
end
