class User < ApplicationRecord
  rolify
  has_one :payment
  has_many :product_listings, dependent: :destroy
  validates :first_name, :last_name, :contact_number, :address, :suburb, :state, :postcode,  presence: true

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
