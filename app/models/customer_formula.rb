class CustomerFormula < ApplicationRecord
    belongs_to :customer

    validates :active, :margin, presence: true
    validates :margin, numericality:{ greater_than: 0 }
end
