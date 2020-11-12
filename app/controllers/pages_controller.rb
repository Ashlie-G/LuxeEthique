class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:profile]
  before_action :authenticate_user!, except: [:index, :about]
  before_action :check_user, only: [:admin]
  
  def index
  end

  def profile
    @profile = current_user
    @listing = current_user.product_listings
    
  end

  def about
  end

  def admin
    @product_listings = ProductListing.all
    @user = User.all
    @details = UserDetail.all
  end
private
def check_user
  if (user_signed_in? && !current_user.has_role?(:admin))
    flash[:alert] = "You are not authorized to access that page"
    redirect_to root_path
  end
end

end
