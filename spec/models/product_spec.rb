require 'rails_helper'

describe Product, type: :model do

  # using Product.create since testing the Class method did not work otherwise
  let(:product) {Product.create(name: "Product X")}

  it "can be searched and result contains matching search term" do
    expect(Product.search("oduct X")).to match_array(product)
  end

  it "name can be searched and result does not contain non-matching search term" do
    expect(Product.search("oduct Y")).to_not match_array(product)
  end

  it "should have many comments" do
    expect(Product.reflect_on_association(:comments).macro).to eq :has_many
  end

  it "should have many orders" do
    expect(Product.reflect_on_association(:orders).macro).to eq :has_many
  end

  it "average rating is a number" do
    expect(Product.first.average_rating).to be_a(Numeric)
  end

end
