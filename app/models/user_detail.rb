class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :state
  has_one :postcode
end
