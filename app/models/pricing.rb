class Pricing < ApplicationRecord
  validates :price_in_euro, presence: true
  validates :old_purchase_price, presence: true
  validates :valid_from_old_purchase, presence: true
  validates :new_purchase_price, presence: true
  validates :valid_from_new_purchase, presence: true
  validates :valid_to_new_purchase, presence: true
  validates :old_retail_price, presence: true
  validates :new_retail_price, presence: true
  validates :new_retail_price_valid_from, presence: true
  validates :new_retail_price_valid_to, presence: true
  validates :change_in_percentage, presence: true
end
