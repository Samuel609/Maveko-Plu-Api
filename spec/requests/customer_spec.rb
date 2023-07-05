require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Name.name
    }
  end

  let(:invalid_attributes) do
    {
      name: nil
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      3.times { create(:customer) }
      get customers_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      customer = create(:customer)
      get customer_url(customer), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data']['id']).to eq customer.id
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Customer' do
        expect do
          post customers_url,
               params: { customer: valid_attributes }, as: :json
        end.to change(Customer, :count).by(1)
      end

      it 'renders a JSON response with the new customer' do
        post customers_url,
             params: { customer: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new customer' do
        expect do
          post customers_url,
               params: { customer: invalid_attributes }, as: :json
        end.to change(Customer, :count).by(0)
      end

      it 'renders a JSON response with errors for the new customer' do
        post customers_url,
             params: { customer: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: Faker::Name.name
        }
      end

      it 'updates the requested customer' do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: new_attributes }, as: :json
        customer.reload
        expect(new_attributes[:name]).to eq customer.name
      end

      it 'renders a JSON response with the customer' do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the customer' do
        customer = Customer.create! valid_attributes
        patch customer_url(customer),
              params: { customer: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
