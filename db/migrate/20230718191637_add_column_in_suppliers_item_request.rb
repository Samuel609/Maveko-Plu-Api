class AddColumnInSuppliersItemRequest < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_item_requests, :valid_from, :date
    add_column :supplier_item_requests, :valid_to, :date
    add_column :supplier_item_requests, :new_price, :integer
  end
end
