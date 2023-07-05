class SupplierItemPricing < ApplicationRecord
    validates :status

    belong_to :item_id, class_name: 'Item'
    validates :item_id, presence: true

    belong_to :supplier_id, class_name: 'Supplier'
    validates :supplier_id, presence: true

    belong_to :pricing_id, class_name: 'Pricing'
    validates :pricing_id, presence: true
end
