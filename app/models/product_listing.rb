class ProductListing < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :purge
  has_one :payment, dependent: :nullify
  validates :name, :brand, :description, :category, :colour, :image,  presence: true
  validates :description, length: { maximum: 500, too_long: "#{count} characters is the maximum allowed"}, presence: true
  validates :price, numericality: 
            { minimum: 0, maximum: (100000), message: " must be a valid dollar amount"}, presence: true

  #sets pagination(limits listings on each page) and shows current product listins
  self.per_page = 4
end
