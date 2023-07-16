class AddReferenceDimensionToItem < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :dimension, foreign_key: { to_table: :dimensions }, null: true
    remove_column :items, :dimensions
  end
end
