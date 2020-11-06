require 'test_helper'

class ProductListingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_listing = product_listings(:one)
  end

  test "should get index" do
    get product_listings_url
    assert_response :success
  end

  test "should get new" do
    get new_product_listing_url
    assert_response :success
  end

  test "should create product_listing" do
    assert_difference('ProductListing.count') do
      post product_listings_url, params: { product_listing: { approved: @product_listing.approved, brand: @product_listing.brand, category: @product_listing.category, colour: @product_listing.colour, description: @product_listing.description, name: @product_listing.name, price: @product_listing.price, user_id: @product_listing.user_id } }
    end

    assert_redirected_to product_listing_url(ProductListing.last)
  end

  test "should show product_listing" do
    get product_listing_url(@product_listing)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_listing_url(@product_listing)
    assert_response :success
  end

  test "should update product_listing" do
    patch product_listing_url(@product_listing), params: { product_listing: { approved: @product_listing.approved, brand: @product_listing.brand, category: @product_listing.category, colour: @product_listing.colour, description: @product_listing.description, name: @product_listing.name, price: @product_listing.price, user_id: @product_listing.user_id } }
    assert_redirected_to product_listing_url(@product_listing)
  end

  test "should destroy product_listing" do
    assert_difference('ProductListing.count', -1) do
      delete product_listing_url(@product_listing)
    end

    assert_redirected_to product_listings_url
  end
end
