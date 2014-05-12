require 'rails/railtie'

module Breakbeat
  class Railtie < Rails::Railtie
    config.breakbeat = ActiveSupport::OrderedOptions.new
  end
end
