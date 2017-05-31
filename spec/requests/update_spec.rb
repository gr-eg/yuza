require "rails_helper"

RSpec.describe "PATCH /users/1" do
  let(:user) { FactoryGirl.create(:user) }

  context 'when the request is valid' do
    before { patch user_path(user), params: { email: 'foo@example.com' } }

    it 'updates the user' do
      expect(user.reload.email).to eq('foo@example.com')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when the request is invalid' do
    let(:invalid_attributes) { FactoryGirl.attributes_for(:user, password: "1234567") }

    before { patch user_path(user), params: invalid_attributes }

    it 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    it 'returns a validation failure message' do
      expect(json["errors"])
      .to match(["Password is too short (minimum is 8 characters)"])
    end
  end
end
