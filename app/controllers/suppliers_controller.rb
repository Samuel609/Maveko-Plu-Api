class SuppliersController < ApplicationController

    def index
        @suppliers = Supplier.all
        render json: {data: @suppliers, success: true, status: 200}, status: :ok
    end

    def show
        @supplier = Supplier.find(params[:id])
        render json: {data: @supplier, success: true, status: 200}, status: :ok
    end

    def create
        @supplier = Supplier.new(supplier_params)
        if @supplier.save
            render json: {data: @supplier, success: true, status: 200}, status: :created
        else
            render json: {data: @supplier.errors, success: false, status: 200}, status: :unprocessable_entity
        end
    end

    def update
        @supplier = Supplier.find(params[:id])
        if @supplier.update(supplier_params)
            render json: {data: @supplier, success: true, status: 200}, status: :ok
        else
            render json: {data: @supplier.errors, success: false, status: 200}, status: :unprocessable_entity
        end
    end

    def destroy
        @supplier = Supplier.find(params[:id])
        if @supplier.destroy()
            render json: {data: @supplier, success: true, status: 200}
        else
            render json: {data: @supplier.errors, success: false, status: 200}
        end
    end

    
    private
    def supplier_params
        params.require(:supplier).permit(:name)
    end
end
