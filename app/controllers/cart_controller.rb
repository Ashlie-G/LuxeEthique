class CartController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :buy]
 
  def show
    @order_items = current_order.order_items
  end

  def buy
  p @order_items
    Stripe.api_key = 'sk_test_51HgT8YJbyxCSQYdENWbWG1btsOQglHMZ7fPNVhacHQ0NrrRctyTT1ZTOzImAGctvTsQWmaz2njn7sVLMhuUyH9Yz00333Yw1og'
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
              name: current_order
            },
            unit_amount: (current_order.total.to_f * 100)
          },
          quantity: current_order
        }
      ]

    })
    render json: session
  end

  def success
    render plain: 'Success!'
  end

  def cancel
    render plain: "The transcation was cancelled!"
  end
end
