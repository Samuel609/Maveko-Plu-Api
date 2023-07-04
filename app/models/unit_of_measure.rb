class UnitOfMeasure < ApplicationRecord
  validates :name, :unit, presence: true
  validates :name, uniqueness: true
end
