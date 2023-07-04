class PricingsController < ApplicationController
    def index
        @pricings = Pricings.all 
        render json: {data: @pricings, success: true, status: 200}
    end

    def show
        @pricings = Pricings.find(params[:id])
        render json: {data: @pricings, success: true, status: 200}
    end

    def create
        @pricings = Pricings.new(pricings_params)
        if @pricings.save
            render json: {data: @pricings, success: true, status: 200}
        else
            render json: {data: @pricings.errors, success: false, status: 400}
        end
    end

    def update
        @pricings = Pricings.find(params[:id])
        if @pricings.update(pricings_params)
            render json: {data: @pricings, success: true, status: 200}
        else
            render json: {data: @pricings.errors, success: false, status: 400}
        end
    end

    def destroy
        @pricings = Pricings.find(params[:id])
        if @pricings.destroy()
            render json: {data: pricings, success: true, status: 200}
        else
            render json: {data: pricings.errors, success: false, status: 400}
        end
    end

    private
    def pricings_params
        params.require(:pricings).permit(:price_in_euro, :old_purchase_price, :valid_from_old_purchase, :new_purchase_price, :valid_from_new_purchase, :valid_to_new_purchase, :old_retail_price, :new_retail_price, :new_retail_price_valid_from, :new_retail_price_valid_to, :change_in_percentage)
    end
end
