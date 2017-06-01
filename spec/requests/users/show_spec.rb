require "rails_helper"

RSpec.describe "GET /users/1" do
  let(:user) { FactoryGirl.create(:user, username: "Sam") }
  before { get user_path(user) }

  it 'returns the user' do
    expect(json["user"]["username"]).to eq("Sam")
  end

  it "doesn't return the encrypted_password" do
    expect(json["user"]["password_digest"]).to eq(nil)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end
