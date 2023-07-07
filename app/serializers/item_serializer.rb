class ItemSerializer < ActiveModel::Serializer
  attributes :item_code, :decor_code, :item_name, :item_description, :image, :dimensions, :article_group, :tax_class, :weight
end

