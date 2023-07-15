class CreateDimensions < ActiveRecord::Migration[7.0]
  def change
    create_table :dimensions do |t|
      t.integer :length
      t.integer :width
      t.integer :height
      
      t.timestamps
    end
  end
end
