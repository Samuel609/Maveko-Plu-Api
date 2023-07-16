class CustomerFormula < ApplicationRecord
    belongs_to :customer

    validates :active, :formula, presence: true
    validates :formula, numericality:{ greater_than: 0 }
end
