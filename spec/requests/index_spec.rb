require "rails_helper"

RSpec.describe "GET /users" do
  let!(:users) { FactoryGirl.create_list(:user, 4) }
  before { get '/users' }

  it 'returns an array of users' do
    expect(json["users"].count).to eq(4)
    expect(json["users"][0]["username"]).to eq(users[0].username)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end
end
