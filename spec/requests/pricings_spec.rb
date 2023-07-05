require 'rails_helper'

RSpec.describe "Pricings", type: :request do
  let(:valid_attributes) do
    {
      price_in_euro: 100,
      old_purchase_price: 100,
      valid_from_old_purchase:  Faker::Date.forward(days: 22) ,
      new_purchase_price:  200 ,
      valid_from_new_purchase:  Faker::Date.forward(days: 25) ,
      valid_to_new_purchase:  Faker::Date.forward(days: 13) ,
      old_retail_price:  250 ,
      new_retail_price: 350,
      new_retail_price_valid_from:  Faker::Date.forward(days: 13) ,
      new_retail_price_valid_to:  Faker::Date.forward(days: 6) ,
      change_in_percentage: 10
    }
  end

  let(:invalid_attributes) do
    {
      price_in_euro: nil,
      old_purchase_price: 100,
      valid_from_old_purchase:  Faker::Date.forward(days: 22) ,
      new_purchase_price:  200 ,
      valid_from_new_purchase:  Faker::Date.forward(days: 25) ,
      valid_to_new_purchase:  Faker::Date.forward(days: 13) ,
      old_retail_price:  250 ,
      new_retail_price: 350,
      new_retail_price_valid_from:  Faker::Date.forward(days: 13) ,
      new_retail_price_valid_to:  Faker::Date.forward(days: 6) ,
      change_in_percentage: 10
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
      pricing = create(:pricing)
      get pricing_url(pricing), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data']['id']).to eq pricing.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pricing" do
        expect {
          post pricings_url,
              params: { pricing: valid_attributes }, as: :json
        }.to change(Pricing, :count).by(1)
      end

      it "renders a JSON response with the new item" do
        post pricings_url,
            params: { pricing: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pricing" do
        expect {
          post pricings_url,
              params: { pricing: invalid_attributes }, as: :json
        }.to change(Pricing, :count).by(0)
      end

      it "renders a JSON response with errors for the new pricing" do
        post pricings_url,
            params: { pricing: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          price_in_euro: 300,
        }
      }

      it "updates the requested pricing" do
        pricing = Pricing.create! valid_attributes
        patch pricing_url(pricing),
              params: { pricing: new_attributes }, as: :json
        pricing.reload
        expect(new_attributes[:price_in_euro]).to eq pricing.price_in_euro
      end

      it "renders a JSON response with the pricing" do
        pricing = Pricing.create! valid_attributes
        patch pricing_url(pricing),
              params: { pricing: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the pricing" do
        pricing = Pricing.create! valid_attributes
        patch pricing_url(pricing),
              params: { pricing: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
