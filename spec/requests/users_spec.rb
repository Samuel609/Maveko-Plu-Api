require 'rails_helper'

RSpec.describe "Users", type: :request do
  include_examples('request_shared_spec', 'users', 2)

  let(:valid_attributes) do
    {
      email: Faker::Internet.email,
      password: "pass123",
      password_confirmation: "pass123"
    }
  end

  let(:invalid_attributes) do 
    {
      email: Faker::Internet.email,
      password: nil,
      password_confirmation: "XXXXXXY"
    }
  end

  let(:new_attributes) do 
    {
      email: Faker::Internet.email,
      password: "XXXXXXX",
      password_confirmation: "XXXXXXX"
    }
  end
end
