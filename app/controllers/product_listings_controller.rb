class ProductListingsController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: [:create, :buy]
  before_action :set_product_listing, only: [:show, :edit, :update, :destroy, :buy]
  before_action :authenticate_user!, except: [:index]
  before_action :check_user, only: [:admin]
  

  # GET /product_listings
  # GET /product_listings.json
  def index
    @product_listings = ProductListing.all

  end

  # GET /product_listings/1
  # GET /product_listings/1.json
  def show

  end

  # GET /product_listings/new
  def new
    @product_listing = ProductListing.new
  
  end

  # GET /product_listings/1/edit
  def edit
  end

  # POST /product_listings
  # POST /product_listings.json
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

  # PATCH/PUT /product_listings/1
  # PATCH/PUT /product_listings/1.json
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

  # DELETE /product_listings/1
  # DELETE /product_listings/1.json
  def destroy
    @product_listing.destroy
    respond_to do |format|
      format.html { redirect_to product_listings_url, notice: 'Product listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def buy
    Stripe.api_key = "sk_test_51HgT8YJbyxCSQYdENWbWG1btsOQglHMZ7fPNVhacHQ0NrrRctyTT1ZTOzImAGctvTsQWmaz2njn7sVLMhuUyH9Yz00333Yw1og"
    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      mode: 'payment',
      success_url: success_url(params[:id]),
      cancel_url: cancel_url(params[:id]),
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

  def success
    redirect_to success_url
  end

  def cancel
    redirect_to cancel_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_listing
      @product_listing = ProductListing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_listing_params
      params.require(:product_listing).permit(:name, :brand, :description, :price, :category, :colour, :approved, :image, :user_id)
    end

    def check_user
      if (user_signed_in? && !current_user.has_role?(:admin))
        flash[:alert] = "You are not authorized to access that page"
        redirect_to root_path
      end
    end
end
