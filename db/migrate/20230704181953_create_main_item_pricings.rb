class CreateMainItemPricings < ActiveRecord::Migration[7.0]
  def change
    create_table :main_item_pricings do |t|
      t.references :item, null: false, foreign_key: true
      t.references :pricing, null: false, foreign_key: true

      t.timestamps
    end
  end
end
