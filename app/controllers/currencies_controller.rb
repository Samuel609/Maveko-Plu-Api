class CurrenciesController < ApplicationController
    include Common

    private
    def model_params
        params.require(:payload).permit(:name, :symbol, :currency_id)
    end    
end
