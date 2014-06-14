# A status report given to a particular service. These can be updated
# manually by our infrastructure staff, but it is also created
# periodically during an outage if the latest status is 'good'.
class Report < ActiveRecord::Base
  belongs_to :service

  KINDS = %w(good minor major)

  validates :kind, presence: true, inclusion: { in: KINDS }
  validates :text, presence: true
  validates :service, presence: true

  scope :current, -> { order(:created_at).first }

  def self.for service
    responsive = Breakbeat.ping service
    status = case
    when responsive && service.down?
      'good'
    when (not responsive) && service.up?
      'minor'
    when (not responsive) && service.down?
      'major'
    else
      nil
    end

    return service.status if status.nil?
    service.reports.create kind: status, text: I18n.t("default_status.#{status}")
  end
end
