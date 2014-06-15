# A status report given to a particular service. These can be updated
# manually by our infrastructure staff, but it is also created
# periodically during an outage if the latest status is 'good'.
class Report < ActiveRecord::Base
  belongs_to :service

  KINDS = %w(good minor major)

  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :description, presence: true
  validates :service, presence: true

  scope :latest, -> { order :created_at }

  class << self

    def for service
      responsive = Breakbeat.ping service
      status = status_for responsive, service
      raise ArgumentError, "Status did not match matrix" if status.nil?
      service.reports.create \
        kind: status,
        description: I18n.t("default_status.#{status}")
    end

    def status_for(responsive, service)
      case
      when responsive && service.down?
        'good'
      when (not responsive) && service.up?
        'minor'
      when (not responsive) && service.down?
        'major'
      else
        nil
      end
    end
  end
end
