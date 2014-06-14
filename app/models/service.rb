
# An application that sits in the TelVue co-lo space, which acts as a
# service for multiple users and/or organizations. Services go down from
# time to time, for various reasons, so they are kept in the database
# and a status is read from them.

class Service < ActiveRecord::Base
  has_many :reports
  accepts_nested_attributes_for :reports

  before_validation :bootstrap_status_updates, :on => :create

  validates :name, presence: true
  validates :host, presence: true

  validate :host_is_valid_uri

  # Get the current status, inferred from the latest report posted.
  def status
    reports.current
  end

  private
  def host_is_valid_uri
    URI.parse host
  rescue StandardError => error
    errors.add :host, "is not valid URI: #{error.message}"
  end

  def bootstrap_status_updates
    self.status_updates << StatusUpdate.for(self)
  end
end
