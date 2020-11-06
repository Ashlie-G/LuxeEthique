class CreateProductListings < ActiveRecord::Migration[6.0]
  def change
    create_table :product_listings do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.float :price
      t.string :category
      t.string :colour
      t.boolean :approved
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
