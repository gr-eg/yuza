require "rails_helper"

RSpec.describe "DELETE /users/1" do
  let(:user) { FactoryGirl.create(:user) }

  context 'with a valid secret' do

    context 'for an existing user' do
      before { delete user_path(user), headers: { secretkey: "supersecret" } }

      it 'deletes the user' do
        expect { user.reload }.to raise_exception ActiveRecord::RecordNotFound
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'for a non existent user' do
      it 'returns status code 404' do
        expect { delete user_path(-1), headers: { secretkey: "supersecret" } }.
          to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end

  context 'with an invalid secret' do
    before { delete user_path(user) }

    it 'returns status code 401' do
      expect(response).to have_http_status(401)
    end
  end
end
