class CurencySerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :currency_id
end
