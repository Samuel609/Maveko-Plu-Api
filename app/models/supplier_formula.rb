class SupplierFormula < ApplicationRecord
    belongs_to :supplier

    validates :active, :margin, presence: true
    validates :margin, numericality:{ greater_than: 0 }


end
