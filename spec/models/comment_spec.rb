require 'rails_helper'

describe Comment do

  let(:comment) { FactoryBot.build(:comment) }

  it "is not empty" do
    expect(comment.body).to_not be_empty
  end

  it "has a rating" do
    expect(comment.rating).to be_a(Numeric)
  end

end
