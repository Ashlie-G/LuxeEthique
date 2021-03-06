class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :contact_number, :string
    add_column :users, :address, :string
    add_column :users, :suburb, :string
    add_column :users, :state, :string
    add_column :users, :postcode, :integer
  end
end
