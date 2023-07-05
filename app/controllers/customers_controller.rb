class CustomersController < ApplicationController
    def index
        @customers = Customer.all
        render json: {data: @customers, success: true, status: 200}, status: :ok
    end

    def show
        @customer = Customer.find(params[:id])
        render json: {data: @customer, success: true, status: 200}, status: :ok
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            render json: {data: @customer, success: true, status: 200}, status: :created
        else
            render json: {data: @customer.errors, success: false, status: 200}, status: :unprocessable_entity
        end
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            render json: {data: @customer, success: true, status: 200}, status: :ok
        else
            render json: {data: @customer.errors, success: false, status: 200}, status: :unprocessable_entity
        end
    end

    def destroy
        @customer = Customer.find(params[:id])
        if @customer.destroy()
            render json: {data: @customer, success: true, status: 200}
        else
            render json: {data: @customer.errors, success: false, status: 200}
        end
    end

    
    private
    def customer_params
        params.require(:customer).permit(:name)
    end
end


