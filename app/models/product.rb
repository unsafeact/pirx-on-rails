class Product < ApplicationRecord

  def self.search(search_term)
    if Rails.env.development? then
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end

end
