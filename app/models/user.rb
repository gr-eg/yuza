class User < ApplicationRecord
  validates :username, :email, :password, presence: true
  validates :password, length: { minimum: 8 }

  has_secure_password
end
