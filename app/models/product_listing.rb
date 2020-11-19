class ProductListing < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :purge
  has_one :payment, dependent: :destroy
  validates :name, :brand, :description, :price, :category, :colour, :image,  presence: true

  #sets pagination(limits listings on each page) and shows current product listins
  self.per_page = 4
end
