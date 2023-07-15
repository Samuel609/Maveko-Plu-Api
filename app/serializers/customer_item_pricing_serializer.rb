class CustomerItemPricingSerializer < ActiveModel::Serializer
  attributes :id, :item, :customer, :pricing
end
