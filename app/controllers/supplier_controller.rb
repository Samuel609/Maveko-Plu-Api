class SupplierController < ApplicationController

    def index
        @suppliers = Supplier.all
        render jsom: {data: @suppliers, success: true, status: 200}
    end

    def show
        @supplier = Supplier.find(params[:id])
        render jsom: {data: @supplier, success: true, status: 200}
    end

    def create
        @supplier = Supplier.new(Supplier_params)
        if @supplier.save
            render json: {data: @supplier, success: true, status: 200}
        else
            render json: {data: @supplier.errors, success: false, status: 200}
        end
    end

    def update
        @supplier = Supplier.find(params[:id])
        if @supplier.update(Supplier_params)
            render json: {data: @supplier, success: true, status: 200}
        else
            render json: {data: @supplier.errors, success: false, status: 200}
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
