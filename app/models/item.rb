class Item < ApplicationRecord
  validates :item_code, :decor_code, :item_name, :item_description, :dimensions, :article_group, :tax_class, :weight, presence: true

  belongs_to :base_unit, class_name: 'UnitOfMeasure'
  validates :base_unit_id, presence: true

  belongs_to :target_unit, class_name: 'UnitOfMeasure'
  validates :target_unit_id, presence: true
end
