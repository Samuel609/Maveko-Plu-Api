class SupplierItemRequest < ApplicationRecord
  validates :item_code, :item_description, :dimensions, :price_per_pc, :base_unit, :target_unit, :currency, :valid_from, :valid_to, presence: true

  belongs_to :supplier_document, class_name: 'SupplierDocument'
  validates :supplier_document, presence: true
end
