class CustomerItemPricingSerializer < ActiveModel::Serializer
  attributes :id, :customer, :pricing
  has_one :pricing
end
