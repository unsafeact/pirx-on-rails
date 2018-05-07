class SimplePagesController < ApplicationController

  def index
  end

  def landing_page
    @products = Product.limit(4)
  end

  def before_landing
    render layout: "landing_layout"
  end

  def contact
    # sleep 1
    redirect_to root_path, notice: "Sorry, no contact! You have been redirected!"
  end

end
