require 'bcrypt'

# A User of the system, who authenticates to the backend in order to
# modify services in some way, either to create new ones or write
# reports.

class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
end
