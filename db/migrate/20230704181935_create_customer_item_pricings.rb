class CreateCustomerItemPricings < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_item_pricings do |t|
      t.references :item, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :pricing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
