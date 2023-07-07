class PricingsController < ApplicationController
    before_action :set_price_saved, only: [:updatePrice, :updateApproval]
    def index
        @pricings = Pricing.all 
        updatePrice(13, 1)
        updateApproval(1, 1)
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
    
    #price update function
    def updatePrice(updated_price, supplierItemPriceID)
        #takes the price to be updated
        #updates it in the supplierItemPriceID
        supplierItemPrice = SupplierItemPricing.find(supplierItemPriceID)
        supplierPricing = supplierItemPrice.pricing
        #saving the the current price
        old_price = supplierPricing.new_purchase_price
        supplierPricing.new_purchase_price = updated_price
        supplierPricing.old_purchase_price = old_price
        supplierPricing.save
    
        #save the price to be updated
        #on a global variable
        #so that main and customer item pricing can get them
        @priceSaved = updated_price
        puts @priceSaved
    end
    #approval function
    def updateApproval(mainItemPriceID, customerItemPriceID)
        mainItemPrice = MainItemPricing.find(mainItemPriceID)
        #getting the pricing from main(maveko)
        mainPricing = mainItemPrice.pricing
        #updating for main(maveko)
        main_old_price = mainPricing.new_purchase_price
        mainPricing.new_purchase_price = @priceSaved
        mainPricing.old_purchase_price = main_old_price
        #saving on the database
        mainPricing.save
        
        
        customerItemPrice = CustomerItemPricing.find(customerItemPriceID)
        #getting the pricing from customer
        customerPricing = customerItemPrice.pricing
        #updating for customer
        customer_old_price = customerPricing.new_retail_price
        customerPricing.new_retail_price = @priceSaved
        customerPricing.old_retail_price = customer_old_price
        #saving on the database
        customerPricing.save
    end
end
