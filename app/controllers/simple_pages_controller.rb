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
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
      to: 'spam@mylu.de',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
  end

end
