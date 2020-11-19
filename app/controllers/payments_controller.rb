class PaymentsController < ApplicationController
  # ensures the person on the page is a user
   before_action :authenticate_user!
# action for when payment is successful.
# finding the correct product listing my the eventid, assigning the buyer to the 
# current user, creating a new sale and then making the item unapproved by changing the boolean value from true to false.
  def success
    # using find to find exact result that matches the conditions(params with correct eventId)
    @product_listing = ProductListing.find(params["eventId"])
    @sale = Payment.create(user_id: current_user.id, buyer_email: current_user.email, seller_email: @product_listing.user.email, product_listing_id: @product_listing.id, amount: @product_listing.price)
    @product_listing.approved = false
    @product_listing.save!


  end
# action to run if payment unsuccessful
  def cancel
    redirect_to root_url, flash[:alert] = "Something went wrong."
  end

end
