class Employee < ApplicationRecord
    has_many :employee_clients
    has_many :clients, through: :employee_clients, class_name: 'Client'
end
