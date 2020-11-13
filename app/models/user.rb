class User < ApplicationRecord
  rolify
  has_one :user_detail, dependent: :destroy
  has_many :product_listings, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
