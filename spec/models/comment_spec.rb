require 'rails_helper'

describe Comment do

  let(:comment) { FactoryBot.build(:comment) }

  it "should belong to user" do
    expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
  end

  it "should belong to product" do
    expect(Comment.reflect_on_association(:product).macro).to eq :belongs_to
  end

  it "contains a message" do
    expect(comment.body).to_not be_empty
  end

  it "contains a user_id" do
    expect(comment.user_id).to be_a(Integer)
  end

  it "contains a product_id" do
    expect(comment.product_id).to be_a(Integer)
  end

  it "has a rating" do
    expect(comment.rating).to be_between(1,5)
  end

end
