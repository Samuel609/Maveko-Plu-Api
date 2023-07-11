require 'rails_helper'

RSpec.describe "Currencies", type: :request do
  include_examples('request_shared_spec', 'currencies', 5)

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

  let(:new_attributes) do
    {
      name: Faker::Currency.name,
    }
  end

end
