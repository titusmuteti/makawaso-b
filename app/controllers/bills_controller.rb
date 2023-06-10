class BillsController < ApplicationController
    def index
        bills = Bill.all
        render json: bills, status: :ok
    end

    def show
        bill = Bill.find(params[:id])
        render json: bill, status: :ok
    end

    def create
        bill = Bill.create!(bill_params)
        render json: bill, status: :created
    end

    def update
        bill = Bill.find(params[:id])
        employee.update!(bill_params)
        render json: bill, status: :ok
    end

    def destroy
        bill = Bill.find(params[:id])
        bill.destroy
        render json: {message: "Bill deleted"}, status: :ok
    end

    private

    def bill_params
        params.permit(:date_read, :previous_reading, :current_reading, :balance, :paid, :date_paid)
    end
end
