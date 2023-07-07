class LinkUserToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :user, index: true, null: false, foreign_key: true
  end
end
