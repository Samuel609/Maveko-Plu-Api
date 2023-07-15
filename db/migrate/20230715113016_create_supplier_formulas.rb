class CreateSupplierFormulas < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_formulas do |t|
      t.boolean :active 
      t.float :margin
      t.references :supplier, null: false, foreign_key: true
      t.timestamps
    end
  end
end
