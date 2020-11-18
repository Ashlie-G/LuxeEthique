class PagesController < ApplicationController
  # ensuring only users can visit pages other than the index(landing page), about and contact page(anyone can view these)
  before_action :authenticate_user!, except: [:index, :about, :contact]
  # ensures only admins can see the admin page, custom method defined in private section
  before_action :check_user, only: [:admin]
  
  def index
  end
# making all listings of the current user available for render to the view
  def profile
    @listing = current_user.product_listings
  end

  def about
  end
# making all users, product listings and sales available for the admin dashboard, pagination used for product listings so limit is set
  def admin
    #eager loader method .includes on all users for user_details
    @user = User.all
    @product_listings = ProductListing.paginate(page: params[:page])
    @sales = Payment.all

  end
# contact action, no connection needed to model, external
  def contact
  end

private
# custom method to check if the user is signed in and has an admin role in order to access the admin page. Used for the before action at top of page.
def check_user
  if (user_signed_in? && !current_user.has_role?(:admin))
    flash[:alert] = "You are not authorized to access that page"
    redirect_to root_path
  end
end

end
