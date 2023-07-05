require 'rails_helper'

RSpec.describe "Suppliers", type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:supplier) }
      get suppliers_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      supplier = create(:supplier)
      get supplier_url(supplier), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data']['id']).to eq supplier.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new supplier" do
        expect {
          post suppliers_url,
              params: { supplier: valid_attributes }, as: :json
        }.to change(Supplier, :count).by(1)
      end

      it "renders a JSON response with the new supplier" do
        post suppliers_url,
            params: { supplier: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new supplier" do
        expect {
          post suppliers_url,
              params: { supplier: invalid_attributes }, as: :json
        }.to change(Supplier, :count).by(0)
      end

      it "renders a JSON response with errors for the new supplier" do
        post suppliers_url,
            params: { supplier: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: Faker::Name.name,
        }
      }

      it "updates the requested supplier" do
        supplier = Supplier.create! valid_attributes
        patch supplier_url(supplier),
              params: { supplier: new_attributes }, as: :json
        supplier.reload
        expect(new_attributes[:name]).to eq supplier.name
      end

      it "renders a JSON response with the supplier" do
        supplier = Supplier.create! valid_attributes
        patch supplier_url(supplier),
              params: { supplier: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the supplier" do
        supplier = Supplier.create! valid_attributes
        patch supplier_url(supplier),
              params: { supplier: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
