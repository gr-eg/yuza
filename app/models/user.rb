class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :username, :email, uniqueness: true

  has_secure_password
end
