class CustomerController < ApplicationController
    def index
        @customers = Customer.all
        render jsom: {data: @customers, success: true, status: 200}
    end

    def show
        @customer = Customer.find(params[:id])
        render jsom: {data: @customer, success: true, status: 200}
    end

    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            render json: {data: @customer, success: true, status: 200}
        else
            render json: {data: @customer.errors, success: false, status: 200}
        end
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            render json: {data: @customer, success: true, status: 200}
        else
            render json: {data: @customer.errors, success: false, status: 200}
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


