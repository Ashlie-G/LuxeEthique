class ProductListingsController < ApplicationController
  #cancancan component that sets up before_filter which calls load_resource, authorize_resource and santizes product listing params
  # load_and_authorize_resource param_method: :product_listing_params
 #ideally would not have this skip before action for buy, however the way stripe was implemented require this as the action controller throws an error. 
  skip_before_action :verify_authenticity_token, only: [:create, :buy]
  # sets the product listing using private method the the specified pages
  before_action :set_product_listing, only: [:show, :edit, :update, :destroy, :buy]
  # authenticates that the user is a registered user execpt when viewing the index page(shop)
  before_action :authenticate_user!, except: [:index]
  # ensures that only users with an admin role can see specific content realting to product listings
  before_action :check_user, only: [:admin]
  

  #sets pagination(limits listings on each page) and shows current product listins
  def index
    @product_listings = ProductListing.paginate(page: params[:page])
  end
# show action, before action sets the product listings, so no need to reference again in this action
  def show
  end

 
  #creates new product listing
  def new
    @product_listing = ProductListing.new
  
  end

# edit action, before action sets the product listings, so no need to reference again in this action  
  def edit
  end

# action for user/admin creating a new listing
  def create
    @product_listing = ProductListing.new(product_listing_params)
    @product_listing.user = current_user
    respond_to do |format|
      if @product_listing.save
        format.html { redirect_to @product_listing, notice: 'Product listing was successfully created.' }
        format.json { render :show, status: :created, location: @product_listing }
      else
        format.html { render :new }
        format.json { render json: @product_listing.errors, status: :unprocessable_entity }
      end
    end
  end

# action when admin is updating a listing
  def update
    respond_to do |format|
      if @product_listing.update(product_listing_params)
        format.html { redirect_to @product_listing, notice: 'Product listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_listing }
      else
        format.html { render :edit }
        format.json { render json: @product_listing.errors, status: :unprocessable_entity }
      end
    end
  end

# action when user or admin deletes product listing
  def destroy
    @product_listing.destroy
    respond_to do |format|
      format.html { redirect_to product_listings_url, notice: 'Product listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# action to run stripe on the product listings
  def buy
    Stripe.api_key = ENV['STRIPE_API_KEY']
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: "#{product_listings_url}/payments/success?eventId=#{@product_listing.id}",
      cancel_url: "#{product_listings_url}",
      line_items: [
        {
          price_data: {
            currency: 'aud',
            product_data: {
              name: @product_listing.name
            },
            unit_amount: (@product_listing.price.to_f * 100).to_i
          },
          quantity: 1
        }
      ]

    })
    render json: session
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # using find as only looking for single record by id
    def set_product_listing
      @product_listing = ProductListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_listing_params
      params.require(:product_listing).permit(:name, :brand, :description, :price, :category, :colour, :approved, :image, :user_id)
    end

# custom method to check if the user is signed in and has an admin role in order to access the admin page. Used for the before action at top of page.
    def check_user
      if (user_signed_in? && !current_user.has_role?(:admin))
        flash[:alert] = "You are not authorized to access that page"
        redirect_to root_path
      end
    end
end
