class MainItemPricing < ApplicationRecord
    
    # belongs_to :item, class_name: 'Item'
    # validates :item, presence: true

    belongs_to :pricing, class_name: 'Pricing'
    validates :pricing, presence: true
end
