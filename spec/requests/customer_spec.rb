require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  include_examples('request_shared_spec', 'customers', 3)

  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      user_id: create(:user).id
    }
  end

  let(:invalid_attributes) do
    {
      name: nil,
      user_id: create(:user).id
    }
  end

  let(:new_attributes) do
    {
      name: Faker::Name.name
    }
  end
end
