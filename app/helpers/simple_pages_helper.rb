module SimplePagesHelper
  # def get_featured_products
  #   featured_products = $redis.get("featured_products")
  #   if featured_products.nil?
  #     featured_products = Product.limit(4).to_json
  #     $redis.set("featured_products", featured_products)
  #     $redis.expire("featured_products",1.hour.to_i)
  #   end
  #   JSON.load featured_products
  # end
end
