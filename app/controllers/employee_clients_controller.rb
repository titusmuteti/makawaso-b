class EmployeeClientsController < ApplicationController
    before_action :set_employee_client, only: [:show, :update, :destroy]
  
    def index
      @employee_clients = EmployeeClient.all
      render json: @employee_clients
    end
  
    def show
      render json: @employee_client
    end
  
    def create
      @employee_client = EmployeeClient.new(employee_client_params)
      if @employee_client.save
        render json: @employee_client, status: :created
      else
        render json: @employee_client.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @employee_client.update(employee_client_params)
        render json: @employee_client
      else
        render json: @employee_client.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @employee_client.destroy
      head :no_content
    end
  
    private
  
    def set_employee_client
      @employee_client = EmployeeClient.find(params[:id])
    end
  
    def employee_client_params
      params.require(:employee_client).permit(:employee_id, :client_id)
    end
  end
  