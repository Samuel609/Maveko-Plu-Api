require 'rails_helper'

RSpec.describe "CustomerFormulas", type: :request do
  include_examples('request_shared_spec', 'customer_formulas', 6)

  let(:valid_attributes) do
    {
      formula: 12.3,
      active: true,
      customer_id: create(:customer).id
    }
  end

  let(:invalid_attributes) do
    {
      formula: nil,
      active: nil,
      customer_id: create(:customer).id
    }
  end

  let(:new_attributes) do
    {
      formula: 11.2,
    }
  end
end
