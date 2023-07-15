class CreateCustomerFormulas < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_formulas do |t|

      t.boolean :active 
      t.float :margin
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
