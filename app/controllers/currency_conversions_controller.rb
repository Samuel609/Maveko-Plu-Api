require 'httparty'

class CurrencyConversionsController < ApplicationController
    def index
        amount = parse[:amount]
        source_currency = parse[:source_currency]
        target_currency = params[:target_currency]
        response = HTTParty.get("https://api.fastforex.io/convert?from=#{source_currency}&to=#{target_currency}&amount=#{amount}&api_key=476651c9d6-ef57ea0dc7-rxwndd")
        @rate = JSON.parse(response.body)['result']
        render json: @rate
    end
end
