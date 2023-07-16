class CrossReference < ApplicationRecord
    validates :item_description, :supplier_id, :maveko_id, :customer_id, presence: true
    validates :supplier_id, :maveko_id, :customer_id, uniqueness: true
end
