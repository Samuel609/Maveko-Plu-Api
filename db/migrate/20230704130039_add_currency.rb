class AddCurrency < ActiveRecord::Migration[7.0]
  def change
    add_reference :pricings, :currency, foreign_key: { to_table: :currencies }, null: true
  end
end
