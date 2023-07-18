class User < ApplicationRecord
    has_secure_password
    PRICELISTMANAGER = "pricelistmanager".freeze
    PRICELISTUPDATER = "pricelistupdater".freeze
    PRICEAPPROVER = "priceapprover".freeze
    SUPPLIER = "supplier".freeze
    CUSTOMER = "customer".freeze
    FORMULAMASTER = "formulamaster".freeze

  
    ROLES = [PRICELISTMANAGER, PRICELISTUPDATER, PRICELISTAPPROVER, SUPPLIER, CUSTOMER, FORMULAMASTER].freeze
  
    validates :role, inclusion: { in: ROLES }
    validates :email, presence: true, uniqueness: true
    validates :password, :password_confirmation, presence: true
end
