class CustomerItemPricing < ApplicationRecord
    belongs_to :item, class_name: 'Item'
    validates :item, presence: true

    belongs_to :customer, class_name: 'Customer'
    validates :customer, presence: true

    belongs_to :pricing, class_name: 'Pricing'
    validates :pricing, presence: true
end
