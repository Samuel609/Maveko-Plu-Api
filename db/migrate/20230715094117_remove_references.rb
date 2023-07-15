class RemoveReferences < ActiveRecord::Migration[7.0]
  def change
    remove_reference :supplier_item_pricings, :item, foreign_key: true
    remove_reference :main_item_pricings, :item, foreign_key: true
    remove_reference :customer_item_pricings, :item, foreign_key: true
  end
end
