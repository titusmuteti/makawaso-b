class ClientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :phone_number

  has_many :employee_clients
  has_many :employees, through: :employee_clients
end