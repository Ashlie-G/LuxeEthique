class ProductListing < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :name, :brand, :description, :price, :category, :colour, :image,  presence: true

  self.per_page = 4
end
