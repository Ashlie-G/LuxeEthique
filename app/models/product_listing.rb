class ProductListing < ApplicationRecord
  belongs_to :user
  has_one :payment, dependent: :destroy
  has_one_attached :image, dependent: :purge
  validates :name, :brand, :description, :price, :category, :colour, :image,  presence: true

  #sets pagination(limits listings on each page) and shows current product listins
  self.per_page = 3
end
