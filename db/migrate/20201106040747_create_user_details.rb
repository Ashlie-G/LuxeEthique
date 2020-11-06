class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.string :first_name
      t.string :last_name
      t.integer :contact_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :suburb
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
