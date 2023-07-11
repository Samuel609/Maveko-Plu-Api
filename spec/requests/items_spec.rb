require 'rails_helper'

RSpec.describe "Items", type: :request do
  include_examples('request_shared_spec', 'items', 10)
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
      decor_code: nil,
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

  let(:new_attributes) do
    {
      item_code: Faker::Code.npi,
    }
  end
end
