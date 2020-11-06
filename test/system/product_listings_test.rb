require "application_system_test_case"

class ProductListingsTest < ApplicationSystemTestCase
  setup do
    @product_listing = product_listings(:one)
  end

  test "visiting the index" do
    visit product_listings_url
    assert_selector "h1", text: "Product Listings"
  end

  test "creating a Product listing" do
    visit product_listings_url
    click_on "New Product Listing"

    check "Approved" if @product_listing.approved
    fill_in "Brand", with: @product_listing.brand
    fill_in "Category", with: @product_listing.category
    fill_in "Colour", with: @product_listing.colour
    fill_in "Description", with: @product_listing.description
    fill_in "Name", with: @product_listing.name
    fill_in "Price", with: @product_listing.price
    fill_in "User", with: @product_listing.user_id
    click_on "Create Product listing"

    assert_text "Product listing was successfully created"
    click_on "Back"
  end

  test "updating a Product listing" do
    visit product_listings_url
    click_on "Edit", match: :first

    check "Approved" if @product_listing.approved
    fill_in "Brand", with: @product_listing.brand
    fill_in "Category", with: @product_listing.category
    fill_in "Colour", with: @product_listing.colour
    fill_in "Description", with: @product_listing.description
    fill_in "Name", with: @product_listing.name
    fill_in "Price", with: @product_listing.price
    fill_in "User", with: @product_listing.user_id
    click_on "Update Product listing"

    assert_text "Product listing was successfully updated"
    click_on "Back"
  end

  test "destroying a Product listing" do
    visit product_listings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product listing was successfully destroyed"
  end
end
