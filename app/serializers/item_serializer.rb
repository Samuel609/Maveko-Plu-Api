class ItemSerializer < ActiveModel::Serializer
  attributes :id, :item_code, :decor_code, :item_name, :item_description, :image, :dimension_id, :article_group, :tax_class, :weight, :main_item_pricing, :customer_item_pricing
  has_one :customer_item_pricing
  has_one :main_item_pricing
end

