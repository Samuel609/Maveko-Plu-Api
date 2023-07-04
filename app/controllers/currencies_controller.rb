class CurrenciesController < ApplicationController
    def index
        @currencies = Currencies.all 
        render json: {data: @currencies, success: true, status: 200}
    end

    def show
        @currencies = Currencies.find(params[:id])
        render json: {data: @currencies, success: true, status: 200}
    end

    def create
        @currencies = Currencies.new(currencies_params)
        if @currencies.save
            render json: {data: @currencies, success: true, status: 200}
        else
            render json: {data: @currencies.errors, success: false, status: 400}
        end
    end

    def update
        @currencies = Currencies.find(params[:id])
        if @currencies.update(currencies_params)
            render json: {data: @currencies, success: true, status: 200}
        else
            render json: {data: @currencies.errors, success: false, status: 400}
        end
    end

    def destroy
        @currencies = Currencies.find(params[:id])
        if @currencies.destroy()
            render json: {data: currencies, success: true, status: 200}
        else
            render json: {data: currencies.errors, success: false, status: 400}
        end
    end

    private
    def currencies_params
        params.require(:currencies).permit(:name, :symbol)
    end    
end
