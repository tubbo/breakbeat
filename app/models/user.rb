require 'bcrypt'

# Simple user authentication class.

class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true
end
