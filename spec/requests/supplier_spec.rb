require 'rails_helper'

RSpec.describe "Suppliers", type: :request do
  include_examples('request_shared_spec', 'suppliers', 2)
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

  let(:new_attributes) do
    {
      name: Faker::Name.name,
    }
  end
end
