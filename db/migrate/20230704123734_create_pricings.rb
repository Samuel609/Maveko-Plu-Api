class CreatePricings < ActiveRecord::Migration[7.0]
  def change
    create_table :pricings do |t|
      t.integer :price_in_euro
      t.integer :old_purchase_price
      t.date :valid_from_old_purchase
      t.integer :new_purchase_price
      t.date :valid_from_new_purchase
      t.date :valid_to_new_purchase
      t.integer :old_retail_price
      t.integer :new_retail_price
      t.date :new_retail_price_valid_from
      t.date :new_retail_price_valid_to
      t.integer :change_in_percentage

      

      t.timestamps
    end
  end
end
