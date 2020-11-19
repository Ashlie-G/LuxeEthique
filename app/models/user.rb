class User < ApplicationRecord
  rolify
  has_many :product_listings, dependent: :destroy
  has_one :payment, dependent: :destroy
  validates :first_name, :last_name, :contact_number, :address, :suburb, length: { maximum: 50, too_long: "#{count} characters is the maximum allowed"}, presence: true
  validates :state, presence: true
  validates :postcode, length: { is: 4 }, presence: true

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
