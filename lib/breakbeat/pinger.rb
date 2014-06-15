require 'net/http'

# Code for checking Service URLs.

module Breakbeat
  class Pinger
    # Make an HTTP request to the service's base URL.
    def self.check_status_for service_url
      http = Net::HTTP.new service_url
      request = Net::HTTP::Get.new '/'
      response = http.request request
      response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
    end
  end
end
