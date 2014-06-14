require 'breakbeat/railtie'
require 'net/http'

module Breakbeat
  def self.config
    Rails.application.config.breakbeat
  end

  # Shells out to the `ping` command to check high-level connectivity of
  # a Service.
  #
  # Make an HTTP request to the service's base URL.
  def self.ping service
    http = Net::HTTP.new URI.parse("http://#{service.url}")
    request = Net::HTTP::Get.new '/'
    response = http.request request
    response.code =~ /\A2|3/
  end
end
