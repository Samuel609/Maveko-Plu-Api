class AddReferenceCols < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :base_unit, foreign_key: { to_table: :unit_of_measures }, null: true
    add_reference :items, :target_unit, foreign_key: { to_table: :unit_of_measures }, null: true
  end
end
