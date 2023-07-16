class SupplierDocument < ApplicationRecord
    belongs_to :supplier
    validates :reference_no, presence: true
end
