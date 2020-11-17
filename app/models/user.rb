class User < ApplicationRecord
  rolify
  has_one :payment, dependent: :destroy
  #has_one :user_detail # inverse_of: :user
  has_many :product_listings, dependent: :destroy
  #accepts_nested_attributes_for :user_detail
  # validates_presence_of :user_detail
  validates :first_name, :last_name, :contact_number, :address, :suburb, :state, :postcode,  presence: true
  # validates_associated :user_detail
  # validates_presence_of :user_detail
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
