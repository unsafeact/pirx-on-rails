require 'rails_helper'
require "cancan/matchers"

describe User do

  let(:user) { User.create!(email: "newbie@new.bie", password: "123456", confirmed_at: DateTime.now) }
  let(:ability) {Ability.new(user)}

  it "is not an admin" do
    expect(user.admin).to be false
  end

  it "is not an admin" do
    expect(user.admin).to be false
  end

  it "can manage own account" do
    expect(ability).to be_able_to(:manage, user)
  end

  context "when is not an admin" do

    it "cannot manage Products" do
      expect(ability).to_not be_able_to(:manage, Product.new)
    end

    it "cannot destroy Comments" do
      expect(ability).to_not be_able_to(:destroy, Comment.new)
    end

  end

  context "when is an admin" do

    let(:adminuser) { User.create!(email: "newbie@new.bie", password: "123456", confirmed_at: DateTime.now, admin: true )}
    let(:ability) {Ability.new(adminuser)}

    it "is an admin" do
      expect(adminuser.admin).to be true
    end

    it "can manage Products" do
      expect(ability).to be_able_to(:manage, Product.new)
    end

    it "can destroy Comments" do
      expect(ability).to be_able_to(:destroy, Comment.new)
    end

  end

end
