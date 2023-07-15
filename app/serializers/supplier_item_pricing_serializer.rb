class SupplierItemPricingSerializer < ActiveModel::Serializer
  attributes :id, :item, :supplier, :pricing, :status
end
