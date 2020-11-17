class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :contact]
  before_action :check_user, only: [:admin]
  
  def index
  end

  def profile
    # @user = current_user
    @listing = current_user.product_listings
  end

  def about
  end

  def admin
    #eager loader method .includes on all users for user_details
    @user = User.all
    @product_listings = ProductListing.paginate(page: params[:page])
    @orders = Payment.all

  end

  def contact
  end

private

# def set_user
#   @user = User.find_by(params[:id])
# end

def check_user
  if (user_signed_in? && !current_user.has_role?(:admin))
    flash[:alert] = "You are not authorized to access that page"
    redirect_to root_path
  end
end

end
