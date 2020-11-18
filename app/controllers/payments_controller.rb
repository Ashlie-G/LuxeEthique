class PaymentsController < ApplicationController
  # ensures the person on the page is a user
   before_action :authenticate_user!
# action for when payment is successful.
# finding the correct product listing my the id, assigning the buyer to the 
# current user, creating a new sale and then making the item unapproved by changing the boolean value from true to false.
  def success
    # using find_by as only looking for a sinlge record
    @product_listing = ProductListing.find_by(params[:id])
    @buyer = current_user
    @sale = Payment.create(user_id: @buyer.id, buyer_email: @buyer.email, seller_email: @product_listing.user.email, product_listing_id: @product_listing.id, amount: @product_listing.price)
    @product_listing.update(approved: false)
   

  end
# action to run if payment unsuccessful
  def cancel
    redirect_to root_url, notice: "Something went wrong."
  end
end
