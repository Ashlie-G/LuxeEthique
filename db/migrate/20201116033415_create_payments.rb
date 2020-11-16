class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product_listing, null: false, foreign_key: true
      t.string :buyer_email
      t.string :seller_email
      t.float :amount

      t.timestamps
    end
  end
end
