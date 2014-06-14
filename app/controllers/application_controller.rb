require 'iceburn/filters'
require 'breakbeat/user_authentication'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks.
  protect_from_forgery :with => :null_session

  # Filter HTML requests.
  include Iceburn::Filters

  # Authenticate users.
  include Breakbeat::UserAuthentication
end
