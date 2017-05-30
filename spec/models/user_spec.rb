require 'rails_helper'

RSpec.describe User do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:password).is_at_least(8) }

  it { should have_secure_password }
end
