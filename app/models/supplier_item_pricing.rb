class SupplierItemPricing < ApplicationRecord
    validates :status, presence: true

    belongs_to :item, class_name: 'Item'
    validates :item, presence: true

    belongs_to :supplier, class_name: 'Supplier'
    validates :supplier, presence: true

    belongs_to :pricing, class_name: 'Pricing'
    validates :pricing, presence: true
end
