class MainItemPricingSerializer < ActiveModel::Serializer
  attributes :id, :pricing
  has_one :pricing
end
