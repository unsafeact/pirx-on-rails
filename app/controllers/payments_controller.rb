class PaymentsController < ApplicationController

  before_action :authenticate_user!

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:hidden_product_id].to_i)
    @user = current_user

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i, # amount in cents, again
        currency: "eur",
        source: token,
        description: @product.name,
        receipt_email: params[:stripeEmail]
      )

      if charge.paid
        Order.create(user_id: @user, product_id: @product.id, total: @product.price)
      end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product)
    flash[:notice] = "Thank you! Your order has been placed!"

  end

end
