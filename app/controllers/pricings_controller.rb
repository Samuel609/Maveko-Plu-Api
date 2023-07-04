class PricingsController < ApplicationController
    def index
        @pricings = Pricings.all 
        render json: {data: @pricing, success: true, status: 200}
    end

    def show
        @pricing = Pricings.find(params[:id])
        render json: {data: @pricing, success: true, status: 200}
    end

    def create
        @pricing = Pricings.new(pricing_params)
        if @pricing.save
            render json: {data: @pricing, success: true, status: 200}
        else
            render json: {data: @pricing.errors, success: false, status: 400}
        end
    end

    def update
        @pricing = Pricings.find(params[:id])
        if @pricing.update(pricing_params)
            render json: {data: @pricing, success: true, status: 200}
        else
            render json: {data: @pricing.errors, success: false, status: 400}
        end
    end

    def destroy
        @pricing = Pricings.find(params[:id])
        if @pricing.destroy()
            render json: {data: pricing, success: true, status: 200}
        else
            render json: {data: pricing.errors, success: false, status: 400}
        end
    end

    private
    def pricing_params
        params.require(:pricing).permit(:price_in_euro, :old_purchase_price, :valid_from_old_purchase, :new_purchase_price, :valid_from_new_purchase, :valid_to_new_purchase, :old_retail_price, :new_retail_price, :new_retail_price_valid_from, :new_retail_price_valid_to, :change_in_percentage)
    end
end
