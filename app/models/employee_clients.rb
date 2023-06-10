class EmployeeClients < ApplicationRecord
    belongs_to :employee
    belongs_to :client
end