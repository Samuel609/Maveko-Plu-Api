class MainItemPricing < ApplicationRecord
    belongs_to :pricing, class_name: 'Pricing'
    validates :pricing, presence: true
end
