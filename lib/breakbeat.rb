require 'breakbeat/railtie'
require 'mixlib/shellout'

module Breakbeat
  def self.config
    Rails.application.config.breakbeat
  end

  # Shells out to the `ping` command to check high-level connectivity of
  # a Service.
  def self.ping service
    ping = Mixlib::ShellOut.new "ping -c 1 #{service.url}"
    ping.run_command
    (not ping.error?)
  end
end
