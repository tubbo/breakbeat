# An application that sits in the TelVue co-lo space, which acts as a
# service for multiple users and/or organizations. Services go down from
# time to time, for various reasons, so they are kept in the database
# and a status is read from them.
class Service < ActiveRecord::Base
  has_many :reports
  accepts_nested_attributes_for :reports

  validates :name, presence: true
  validates :host, presence: true

  after_create :ping!

  validate :host_is_valid_uri

  # Get the current status, inferred from the latest report posted.
  def status
    reports.current
  end

  # Queue this Service to be pinged at a later time.
  def ping
    PingService.enqueue self
  end

  # "Ping" this Service, right now, and record results in the status
  # updates. This is called right after the Service model is initially
  # created, to "bootstrap" the reports collection.
  def ping!
    self.reports << Report.for(self)
  end

  private
  def host_is_valid_uri
    URI.parse host
  rescue StandardError => error
    errors.add :host, "is not valid URI: #{error.message}"
  end
end
