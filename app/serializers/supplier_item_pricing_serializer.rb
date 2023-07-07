class SupplierItemPricingSerializer < ActiveModel::Serializer
  attributes :id, :item, :supplier, :pricing
end
