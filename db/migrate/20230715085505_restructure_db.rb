class RestructureDb < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :supplier_item_pricing, index: true, null: false, foreign_key: true
    add_reference :items, :main_item_pricing, index: true, null: false, foreign_key: true
    add_reference :items, :customer_item_pricing, index: true, null: false, foreign_key: true
  end
end
