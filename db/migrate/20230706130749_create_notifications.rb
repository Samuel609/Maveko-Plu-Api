class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :sender, null: false
      t.string :status, null: false
      t.date :delivery_date, null: false, default: "Unread"
      

      t.timestamps
    end
  end
end
