class Service < ActiveRecord::Base
  validates :name, presence: true
  validates :host, presence: true
  validate :host_is_valid_uri

  private
  def host_is_valid_uri
    URI.parse host
  rescue StandardError => error
    errors.add :host, "is not valid URI: #{error.message}"
  end
end
