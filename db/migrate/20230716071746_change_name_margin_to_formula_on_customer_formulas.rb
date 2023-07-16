class ChangeNameMarginToFormulaOnCustomerFormulas < ActiveRecord::Migration[7.0]
  def change
    rename_column :customer_formulas, :margin, :formula
  end
end
