if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_yIKSSTfBuSrzxAM0JvSAgt3R',
    secret_key: 'sk_test_7IZkxoIWMSx9bbW1HsVcoy1u'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
