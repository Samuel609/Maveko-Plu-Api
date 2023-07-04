class CurrenciesController < ApplicationController
    def index
        @currencies = Currency.all 
        render json: {data: @currency, success: true, status: 200}
    end

    def show
        @currency = Currency.find(params[:id])
        render json: {data: @currency, success: true, status: 200}
    end

    def create
        @currency = Currency.new(currency_params)
        if @currency.save
            render json: {data: @currency, success: true, status: 200}
        else
            render json: {data: @currency.errors, success: false, status: 400}
        end
    end

    def update
        @currency = Currency.find(params[:id])
        if @currency.update(currency_params)
            render json: {data: @currency, success: true, status: 200}
        else
            render json: {data: @currency.errors, success: false, status: 400}
        end
    end

    def destroy
        @currency = Currency.find(params[:id])
        if @currency.destroy()
            render json: {data: currency, success: true, status: 200}
        else
            render json: {data: currency.errors, success: false, status: 400}
        end
    end

    private
    def currency_params
        params.require(:currency).permit(:name, :symbol)
    end    
end
