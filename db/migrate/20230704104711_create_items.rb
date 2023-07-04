class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_code
      t.string :decor_code
      t.string :item_name
      t.text :item_description
      t.string :image
      t.string :dimensions
      t.string :article_group
      t.string :tax_class
      t.string :weight

      t.timestamps
    end
  end
end
