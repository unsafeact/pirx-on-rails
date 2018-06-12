require 'rails_helper'
require "cancan/matchers"

describe User do

  let(:default_user) { FactoryBot.build(:user) }
  let(:admin_user) { FactoryBot.build(:admin) }
  let(:invalid_user) { FactoryBot.build(:user, email: "not_an_email")}
  let(:default_ability) {Ability.new(default_user)}
  let(:admin_ability) {Ability.new(admin_user)}

  it "should not validate users without an email address" do
    expect(invalid_user).to_not be_valid
  end

  it "can manage own account" do
    expect(default_ability).to be_able_to(:read, default_user)
    expect(default_ability).to be_able_to(:edit, default_user)
    expect(default_ability).to be_able_to(:update, default_user)
    expect(default_ability).to be_able_to(:destroy, default_user)
  end

  context "when is not an admin" do

    it "is not an admin" do
      expect(default_user.admin).to be false
    end

    it "cannot manage Products" do
      expect(default_ability).to_not be_able_to(:manage, Product.new)
    end

    it "cannot destroy Comments" do
      expect(default_ability).to_not be_able_to(:destroy, Comment.new)
    end

  end

  context "when is an admin" do

    it "is an admin" do
      expect(admin_user.admin).to be true
    end

    it "can manage Products" do
      expect(admin_ability).to be_able_to(:manage, Product.new)
    end

    it "can destroy Comments" do
      expect(admin_ability).to be_able_to(:destroy, Comment.new)
    end

  end

end
