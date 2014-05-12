require 'activemodel'

module Breakbeat
  class Pinger
    include ActiveModel::Model

    attr_accessor :attributes, :url, :responding

    validates :url_responding

    def self.ping url
      pinger = new url: url
      pinger.valid?
      pinger
    end

    # Tests whether the ping was successful.
    def success?
      !!responding
    end

    private
    def url_responding
      `ping -c 1 #{url}`
      @responding ||= $?.success?
    end
  end
end
