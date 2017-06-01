require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:password).is_at_least(8) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:username) }

  it { should have_secure_password }

  it "validates email address" do
    user = FactoryGirl.build(:user, email: "this.is.not.an.email")
    user.valid?
    expect(user.errors).to have_key(:email)
  end
end
