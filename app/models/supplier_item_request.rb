class SupplierItemRequest < ApplicationRecord
  validates :item_code, presence: true
end
