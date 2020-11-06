json.extract! product_listing, :id, :name, :brand, :description, :price, :category, :colour, :approved, :user_id, :created_at, :updated_at
json.url product_listing_url(product_listing, format: :json)
