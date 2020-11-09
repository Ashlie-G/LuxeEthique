class UserDetail < ApplicationRecord
  belongs_to :user
  has_one :state
  has_one :postcode
  accepts_nested_attributes_for :state
  accepts_nested_attributes_for :postcode
end
