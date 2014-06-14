class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :status, :status_message

  def status
    object.status.try :kind
  end

  def status_message
    object.status.try :description
  end
end
