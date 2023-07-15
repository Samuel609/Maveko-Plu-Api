class AddReferenceNumberToSupplierPricing < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_item_pricings, :reference_number, :string
  end
end
