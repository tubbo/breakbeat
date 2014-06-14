# An application that sits in the TelVue co-lo space, which acts as a
# service for multiple users and/or organizations. Services go down from
# time to time, for various reasons, so they are kept in the database
# and a status is read from them.
class Service < ActiveRecord::Base
  has_many :reports
  accepts_nested_attributes_for :reports

  validates :name, presence: true
  validates :url, presence: true

  after_create :ping

  validate :host_is_valid_uri

  # Get the current status, inferred from the latest report posted.
  def status
    reports.latest.first
  end

  # Test if the service is reporting to be down.
  def down?
    return true unless status.present?
    status.kind =~ /minor|major/
  end

  # Test if the service is reporting to be up.
  def up?
    (not down?)
  end

  # Queue this Service to be pinged at a later time.
  def ping
    PingService.enqueue self
  end

  # "Ping" this Service, right now, and record results in the status
  # updates. This is called right after the Service model is initially
  # created, to "bootstrap" the reports collection.
  def ping!
    logger.debug "Pinging #{name}.."
    report = Report.for self
    self.reports << report
    report.persisted?
  end

  private
  def host_is_valid_uri
    URI.parse url
  rescue StandardError => error
    errors.add :url, "is not valid URI: #{error.message}"
  end
end
