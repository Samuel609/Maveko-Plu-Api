class Currency < ApplicationRecord
  validates :name, :symbol, presence: true
  validates :name, uniqueness: true
end
