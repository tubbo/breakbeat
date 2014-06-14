# Show the report's kind and description.
class ReportSerializer < ActiveModel::Serializer
  attributes :kind, :description
end
