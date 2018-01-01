require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryBot.build(:user)
  describe "Validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    # it { should validate_uniqueness_of(:username) }
    # it { should validate_uniqueness_of(:session_token) }
  end

  describe "Associations" do
    it { should have_many(:goals) }
  end

  describe "#password=(password)" do
    it "password_digest should not equal password" do
      user.password=("password")
      expect(user.password_digest).to_not eq("password")
    end
  end

  describe "::find_by_credentials" do
    it "finds a correct user" do
      User.create(username: "jay", password: "password")
      user = User.find_by_credentials("jay", "password")
      expect(user).to_not be_nil
    end
  end

  describe "#ensure_session_token" do

  end

  describe "#is_password?(password)" do

  end

  describe "#reset_session_token!" do

  end
end
