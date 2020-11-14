class PaymentsController < ApplicationController
   before_action :authenticate_user!

  def success
    @product_listing = ProductListing.find_by(params[:id])
    @buyer = current_user

    status = @product_listing
    status.update(approved: false)
    status.save
  end

  def cancel
   
  end
end
