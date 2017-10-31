require 'rails_helper'

RSpec.describe User, type: :model do
  #validations
    #(custom? error messages)
  #associations
  #class methods

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) } #TODO custom error message for password_digest?
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe "class methods" do
    subject(:user1) {User.new(username: "John", password: "password123")}

    describe "::find_by_credentials" do
      before(:each) { user1.save }

      context "if valid creds" do
        it "returns user" do
          return_user = User.find_by_credentials("John", "password123")
          expect(return_user).to be(user1)
        end
      end

      context "if invalid creds" do
        it "returns nil" do
          return_user = User.find_by_credentials("John", "testing123")
          expect(return_user).to be(nil)
        end
      end
    end
  end
end
