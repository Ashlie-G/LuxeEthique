class PaymentsController < ApplicationController
   before_action :authenticate_user!

  def success
    @product_listing = ProductListing.find_by(params[:id])
    @buyer = current_user
    @order = Payment.create!(user_id: @buyer.id, buyer_email: @buyer.email, seller_email: @product_listing.user.email, product_listing_id: @product_listing.id, amount: @product_listing.price)
    
    status = @product_listing
    status.update(approved: false)
    status.save

  end

  def cancel
   
  end
end
