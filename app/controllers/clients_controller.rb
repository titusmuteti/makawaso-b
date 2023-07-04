class ClientsController < ApplicationController
    # skip_before_action :authorize, only: :create
    # before_action :authorize
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  
    def index
      clients = Client.all
      render json: clients, include: [:employees], status: :ok
    end
  
    def show
      client = Client.find_by_id(params[:id])
      if client
        render json: client, status: :ok
      else
        render json: { error: "Client not found" }, status: :not_found
      end
    end
  
    def create
      client = Client.new(client_params)
      if client.save
        session[:user_id] = client.id
        render json: client, status: :created
      else
        render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      client = Client.find_by_id(params[:id])
      if client
        if client.update(client_params)
          render json: client, status: :ok
        else
          render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Client not found" }, status: :not_found
      end
    end
  
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
      params.permit(:first_name, :last_name, :email, :phone_number)
    end
  
    # def authorize
    #   render json: { error: "Not authorized" }, status: :unauthorized unless current_user
    # end
  end
  