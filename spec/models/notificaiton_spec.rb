require 'rails_helper'

RSpec.describe Notificaiton, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

it { should validate_presence_of(:title)}
it { should validate_presence_of(:body)}
it { should validate_presence_of(:sender)}
it { should validate_presence_of(:status)}
it { should validate_presence_of(:delivery_date)}

