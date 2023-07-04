class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  
    def index
      clients = Client.all
      render json: clients, include: [:employees], status: :ok
    end
  
    def show
      client = Client.find_by_id(session[:client_id])
      if client
        render json: client, include: [:employees], status: :ok
      else
        render json: { error: "You must be logged in to access this content" }, status: :unauthorized
      end
    end
  
    def create
      client = Client.new(client_params)
      
      if client.save
        # byebug
        session[:client_id] = client.id
        render json: client, status: :created
      else
        render json: { error: client.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # def update
    #   client = Client.find_by_id(params[:id])
    #   if client
    #     if client.update(client_params)
    #       render json: client, status: :ok
    #     else
    #       render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
    #     end
    #   else
    #     render json: { error: "Client not found" }, status: :not_found
    #   end
    # end
  
    def destroy
      client = Client.find_by_id(params[:id])
      if client
        client.destroy
        render json: { message: "Client deleted" }, status: :ok
      else
        render json: { error: "Client not found" }, status: :not_found
      end
    end
  
    private
  
    def client_params
      params.permit(:email, :first_name, :last_name, :phone_number, :password, :confirm_password)
    end

    def record_invalid
      render json: {error: "Invalid user"}, status: :unprocessable_entity
    end

end
  