class AddColumnToUserDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :user_details, :state, :string
    add_column :user_details, :postcode, :integer
  end
end
