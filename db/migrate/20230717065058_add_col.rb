class AddCol < ActiveRecord::Migration[7.0]
  def change
    add_column :supplier_documents, :status, :string, :default => "pending"
    add_column :supplier_documents, :effective_date, :date
  end
end
