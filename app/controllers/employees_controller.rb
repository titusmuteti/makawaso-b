class EmployeesController < ApplicationController
    def index
        employees = Employee.all
        render json: employees, include: [:clients], status: :ok
    end

    def show
        employee = Employee.find(params[:id])
        render json: employee, include: [:clients], status: :ok
    end
    

    private

    def employee_params
        params.permit(:first_name, :last_name, :email, :location)
    end
end
