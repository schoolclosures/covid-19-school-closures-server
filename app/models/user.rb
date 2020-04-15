class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  validates :email, :password, :name, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  has_secure_password 
end
