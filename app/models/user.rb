class User < ApplicationRecord
  rolify
  has_one :payment, dependent: :destroy
  has_one :user_detail # inverse_of: :user
  has_many :product_listings, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  # validates_presence_of :user_detail
  # :first_name, :last_name, :contact_number, :address_line_1, :address_line_2, :suburb, :state, :postcode
  # validates_associated :user_detail
  # validates_presence_of :user_detail
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
