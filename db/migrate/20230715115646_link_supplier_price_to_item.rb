class LinkSupplierPriceToItem < ActiveRecord::Migration[7.0]
  def change
    remove_reference :items, :supplier_item_pricing, foreign_key: true
    add_reference :supplier_item_pricings, :item, index: true, null: false, foreign_key: true
  end
end
