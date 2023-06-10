class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :location
  
  has_many :employee_clients
  has_many :clients, through: :employee_client
end
