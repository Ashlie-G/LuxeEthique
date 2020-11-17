class UserDetail < ApplicationRecord
  belongs_to :user #inverse_of: :user_detail
  # validates_presence_of :user
  # validates :first_name, :last_name, :contact_number, :address_line_1, :address_line_2, :suburb, :state, :postcode, presence: true
  
end
