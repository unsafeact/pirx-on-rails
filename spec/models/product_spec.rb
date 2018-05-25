require 'rails_helper'

describe Product do

let(:product) { FactoryBot.build(:product_with_comments) }

it "name includes 'Product'" do
  expect(product.name).to include("Product")
end

it "has a price" do
  expect(product.price).to be_a(Numeric)
end

it "has comments" do
  # debugger
  expect(product.comments).not_to be_empty       # <===========================
end

  # let(:product) { Product.create!(name: "race bike") }
  # let(:user) { FactoryBot.create(:user) }

  # before do
  #   product.comments.create!(rating: 1, user: user, body: "Awful bike!")
  #   product.comments.create!(rating: 3, user: user, body: "Ok bike!")
  #   product.comments.create!(rating: 5, user: user, body: "Great bike!")
  # end
  #
  # it "returns the average rating of all comments" do
  #   expect(product.average_rating).to eq 3
  # end

  # it "is not valid without name" do
  #   expect(Product.new(description: "Nice bike")).not_to be_valid
  # end


end
