class PricingsController < ApplicationController
    before_action :set_price_saved, only: [:updatePrice, :updateApproval]
    def index
        @pricings = Pricing.all
        render json: {data: @pricings, success: true, status: 200}, status: :ok
    end
    
    def show
        @pricing = Pricing.find(params[:id])
        render json: {data: @pricing, success: true, status: 200}, status: :ok
    end

    def create
        @pricing = Pricing.new(pricing_params)
        if @pricing.save
            render json: {data: @pricing, success: true, status: 200}, status: :created
        else
            render json: {data: @pricing.errors, success: false, status: 400}, status: :unprocessable_entity
        end
    end

    def update
        @pricing = Pricing.find(params[:id])
        if @pricing.update(pricing_params)
            render json: {data: @pricing, success: true, status: 200}, status: :ok
        else
            render json: {data: @pricing.errors, success: false, status: 400}, status: :unprocessable_entity
        end
    end

    def destroy
        @pricing = Pricing.find(params[:id])
        if @pricing.destroy()
            render json: {data: pricing, success: true, status: 200}, status: :ok
        else
            render json: {data: pricing.errors, success: false, status: 400}, status: :unprocessable_entity
        end
    end

    private
    def pricing_params
        params.require(:pricing).permit(:price_in_euro, :old_purchase_price, :valid_from_old_purchase, :new_purchase_price, :valid_from_new_purchase, :valid_to_new_purchase, :old_retail_price, :new_retail_price, :new_retail_price_valid_from, :new_retail_price_valid_to, :change_in_percentage)
    end
    
    def set_price_saved
        @priceSaved = priceSaved
    end
end
