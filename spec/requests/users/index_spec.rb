require "rails_helper"

RSpec.describe "GET /users" do
  let!(:users) { FactoryGirl.create_list(:user, 4) }
  before { get users_path }

  it 'returns an array of users' do
    expect(json["users"].count).to eq(4)
    expect(json["users"][0]["username"]).to eq(users[0].username)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:ok)
  end

  context "pagination" do
    before(:all) do
      Kaminari.configure do |config|
        config.default_per_page = 2
      end
    end

    it 'returns a paginated array of users' do
      expect(json["users"].count).to eq(2)
    end

    it 'returns a link object' do
      expect(json["links"]["first"]).to eq(true)
      expect(json["links"]["last"]).to eq(false)
      expect(json["links"]["prev"]).to eq(nil)
      expect(json["links"]["next"]).to eq(2)
    end

    it 'returns more pages' do
      expect(json["users"][0]["id"]).to eq(users[0].id)
      expect(json["users"][1]["id"]).to eq(users[1].id)
      get users_path(page: json["links"]["next"])
      expect(json["users"][0]["id"]).to eq(users[2].id)
      expect(json["users"][1]["id"]).to eq(users[3].id)
    end

  end
end
