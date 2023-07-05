require 'rails_helper'

RSpec.describe "Currencies", type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Currency.name,
      symbol: Faker::Currency.symbol
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      symbol: Faker::Currency.symbol,
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:pricing) }
      get pricings_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      currency = create(:currency)
      get currency_url(currency), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data']['id']).to eq currency.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Currency" do
        expect {
          post currencies_url,
              params: { currency: valid_attributes }, as: :json
        }.to change(Currency, :count).by(1)
      end

      it "renders a JSON response with the new currency" do
        post currencies_url,
            params: { currency: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Currency" do
        expect {
          post currencies_url,
              params: { currency: invalid_attributes }, as: :json
        }.to change(Currency, :count).by(0)
      end

      it "renders a JSON response with errors for the new currency" do
        post currencies_url,
            params: { currency: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: Faker::Currency.name,
        }
      }

      it "updates the requested currency" do
        currency = Currency.create! valid_attributes
        patch currency_url(currency),
              params: { currency: new_attributes }, as: :json
        currency.reload
        expect(new_attributes[:name]).to eq currency.name
      end

      it "renders a JSON response with the currency" do
        currency = Currency.create! valid_attributes
        patch currency_url(currency),
              params: { currency: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the pricing" do
        currency = Currency.create! valid_attributes
        patch currency_url(currency),
              params: { currency: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
