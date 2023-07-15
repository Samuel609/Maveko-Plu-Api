class CustomerItemPricing < ApplicationRecord
    belongs_to :item
    validates :item, presence: true

    belongs_to :customer
    validates :customer, presence: true

    belongs_to :pricing
    validates :pricing, presence: true
end
