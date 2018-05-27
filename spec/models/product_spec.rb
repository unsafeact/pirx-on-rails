require 'rails_helper'

describe Product do

  let(:product) { FactoryBot.build(:product) }

  it "name includes 'Product'" do
    expect(product.name).to include("Product")
  end

  it "has a price" do
    expect(product.price).to be_a(Numeric)
  end

end
