class CreatePostcodes < ActiveRecord::Migration[6.0]
  def change
    create_table :postcodes do |t|
      t.integer :postcode
      t.references :user_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
