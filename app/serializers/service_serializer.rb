class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :status, :status_message

  def url
    object.url.gsub(/\.teve\.inc\Z/, '.telvue.com')
  end

  def status
    object.status.try :kind
  end

  def status_message
    object.status.try :description
  end
end
