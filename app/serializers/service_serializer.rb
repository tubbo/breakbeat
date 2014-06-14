class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :status
  has_one :status, :as => :report
end
