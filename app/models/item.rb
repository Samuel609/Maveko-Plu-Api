class Item < ApplicationRecord
  validates :item_code, :decor_code, :item_name, :item_description, :dimensions, :article_group, :tax_class, :weight, presence: true
  
  belongs_to :base_unit, class_name: 'UnitOfMeasure'
  validates :base_unit_id, presence: true
  
  belongs_to :target_unit, class_name: 'UnitOfMeasure'
  validates :target_unit_id, presence: true

  belongs_to :supplier_item_pricing
  belongs_to :main_item_pricing
  belongs_to :customer_item_pricing
  
  # has_one :supplier_item_pricing
  # has_one :main_item_pricing
  # has_one :customer_item_pricing
end
