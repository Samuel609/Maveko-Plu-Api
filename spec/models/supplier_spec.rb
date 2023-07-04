require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it 'is valid with valid attributes' do
    it { should validate_presence_of(:name) }
  end
end
