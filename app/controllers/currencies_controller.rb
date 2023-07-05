class CurrenciesController < ApplicationController
    def index
        @currencies = Currency.all 
        render json: {data: @currency, success: true, status: 200}, status: :ok
    end

    def show
        @currency = Currency.find(params[:id])
        render json: {data: @currency, success: true, status: 200}, statu: :ok
    end

    def create
        @currency = Currency.new(currency_params)
        if @currency.save
            render json: {data: @currency, success: true, status: 200}, status: :created
        else
            render json: {data: @currency.errors, success: false, status: 400}, status: :unprocessable_entity
        end
    end

    def update
        @currency = Currency.find(params[:id])
        if @currency.update(currency_params)
            render json: {data: @currency, success: true, status: 200}, status: :ok
        else
            render json: {data: @currency.errors, success: false, status: 400}, status: :unprocessable_entity
        end
    end

    def destroy
        @currency = Currency.find(params[:id])
        if @currency.destroy()
            render json: {data: currency, success: true, status: 200}, status: :ok
        else
            render json: {data: currency.errors, success: false, status: 400}, status: :unprocessable_entity
        end
    end

    private
    def currency_params
        params.require(:currency).permit(:name, :symbol)
    end    
end
