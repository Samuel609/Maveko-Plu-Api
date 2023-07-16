class CreateSupplierItemRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_item_requests do |t|
      t.string :item_code
      t.string :item_description
      t.string :dimensions
      t.string :price_per_pc
      t.string :base_unit
      t.string :target_unit
      t.string :currency
      t.references :supplier_document, null: false, foreign_key: true

      t.timestamps
    end
  end
end
