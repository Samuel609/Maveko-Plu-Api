class CreateSupplierItemPricings < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_item_pricings do |t|
      t.string :status
      t.references :item, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true
      t.references :pricing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
