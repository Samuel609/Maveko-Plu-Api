class CreateCrossReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :cross_references do |t|
      t.string :item_description
      t.integer :supplier_id
      t.integer :maveko_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
