require "rails_helper"

RSpec.describe "POST /users" do
  let(:valid_attributes) { FactoryGirl.attributes_for(:user, username: "bob") }

  context 'when the request is valid' do
    before { post users_path, params: valid_attributes }

    it 'creates a user' do
      expect(json['username']).to eq('bob')
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(:created)
    end
  end

  context 'when the request is invalid' do
    let(:invalid_attributes) { FactoryGirl.attributes_for(:user, username: "") }

    before { post '/users', params: invalid_attributes }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(json["errors"])
      .to match(["Username can't be blank"])
    end
  end
end
