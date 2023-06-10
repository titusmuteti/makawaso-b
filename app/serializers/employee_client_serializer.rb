class EmployeeClientSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :employee
  belongs_to :client
end
