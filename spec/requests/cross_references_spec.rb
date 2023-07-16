require 'rails_helper'

RSpec.describe "CrossReferences", type: :request do
  include_examples('request_shared_spec', 'cross_references', 7)

  let(:valid_attributes) do
    {
      maveko_id:  Faker::Number.number(digits: 4),
      supplier_id:  Faker::Number.number(digits: 4),
      customer_id:  Faker::Number.number(digits: 4),
      item_description: Faker::Lorem.sentence,
    }
  end

  let(:invalid_attributes) do
    {
      maveko_id: nil,
      supplier_id: nil,
      customer_id: nil,
      item_description: Faker::Lorem.sentence,
    }
  end

  let(:new_attributes) do
    {
      item_description: Faker::Lorem.sentence,
    }
  end

end
