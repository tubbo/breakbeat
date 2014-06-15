require 'breakbeat/railtie'
require 'net/http'

module Breakbeat
  class << self
    # Configuration scoped to the Breakbeat app.
    def config
      Rails.application.config.breakbeat
    end

    # Make an HTTP request to the service's base URL.
    def ping service
      http = Net::HTTP.new service.url
      request = Net::HTTP::Get.new '/'
      response = http.request request
      response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
    end
  end
end
