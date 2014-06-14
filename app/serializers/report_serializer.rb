# Show the 
class ReportSerializer < ActiveModel::Serializer
  attributes :kind, :text
  belongs_to :service
end
