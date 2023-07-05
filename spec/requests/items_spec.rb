require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:valid_attributes) do
    {
      item_code: Faker::Code.npi,
      decor_code: Faker::Code.npi,
      item_name: Faker::Name.name ,
      item_description: Faker::Lorem.sentence,
      image: Faker::Lorem.word,
      dimensions: Faker::Lorem.word ,
      article_group: Faker::Lorem.word  ,
      tax_class: Faker::Lorem.word,
      weight: Faker::Lorem.word,
      base_unit_id: create(:unit_of_measure).id,
      target_unit_id: create(:unit_of_measure).id
    }
  end

  let(:invalid_attributes) do
    {
      item_code: nil,
      decor_code: Faker::Code.npi,
      item_name: Faker::Name.name ,
      item_description: Faker::Lorem.sentence,
      image: Faker::Lorem.word,
      dimensions: Faker::Lorem.word ,
      article_group: Faker::Lorem.word  ,
      tax_class: Faker::Lorem.word,
      weight: Faker::Lorem.word,
      base_unit_id: create(:unit_of_measure).id,
      target_unit_id: create(:unit_of_measure).id
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:item) }
      get items_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      item = create(:item)
      get item_url(item), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data']['id']).to eq item.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post items_url,
              params: { item: valid_attributes }, as: :json
        }.to change(Item, :count).by(1)
      end

      it "renders a JSON response with the new item" do
        post items_url,
            params: { item: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post items_url,
              params: { item: invalid_attributes }, as: :json
        }.to change(Item, :count).by(0)
      end

      it "renders a JSON response with errors for the new item" do
        post items_url,
            params: { item: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          item_code: Faker::Code.npi,
        }
      }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        patch item_url(item),
              params: { item: new_attributes }, as: :json
        item.reload
        expect(new_attributes[:item_code]).to eq item.item_code
      end

      it "renders a JSON response with the item" do
        item = Item.create! valid_attributes
        patch item_url(item),
              params: { item: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the item" do
        item = Item.create! valid_attributes
        patch item_url(item),
              params: { item: invalid_attributes },  as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
