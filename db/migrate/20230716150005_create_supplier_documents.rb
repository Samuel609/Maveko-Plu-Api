class CreateSupplierDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_documents do |t|
      t.string :reference_no
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
