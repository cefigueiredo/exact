require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new email: "valid@email.com" }

  describe "email validation" do
    it "validates length of minimum 8 characters" do
      user.email = "1234567"
      user.validate

      expect(user.errors[:email]).to include('is too short (minimum is 8 characters)')
    end
  end

  describe "#authenticate?('password')" do
    it "validates password length of minimum 8 characters" do
      user.authenticate?("1234567")

      expect(user.errors[:password]).to include(
        'is too short (minimum is 8 characters)'
      )
    end
  end
end
