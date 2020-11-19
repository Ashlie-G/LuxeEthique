class PaymentsController < ApplicationController
  # ensures the person on the page is a user
   before_action :authenticate_user!
# action for when payment is successful.
# finding the correct product listing my the id, assigning the buyer to the 
# current user, creating a new sale and then making the item unapproved by changing the boolean value from true to false.
  def success
    # using find_by to find first result that matches the conditions(params with correct ID)
    @product_listing = ProductListing.find(params["eventId"])
    @sale = Payment.create(user_id: current_user.id, buyer_email: current_user.email, seller_email: @product_listing.user.email, product_listing_id: @product_listing.id, amount: @product_listing.price)
    # @product_listing.update_attribute(:approved, false)
   
    @product_listing.approved = false
    @product_listing.save!
    # change = ProductListing.find_by(params[:id])
    # change.update(approved: false)
    # change.save

  end
# action to run if payment unsuccessful
  def cancel
    redirect_to root_url, notice: "Something went wrong."
  end

end
