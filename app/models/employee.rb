class Employee < ApplicationRecord

    has_many :employee_clients
    # has_many :employee_clients, dependent: :destroy
    has_many :clients, through: :employee_clients

    # after_create :associate_with_clients

    # def associate_with_clients
    #     clients = Client.where(condition: true)  # Replace condition with your desired criteria
    #     clients.each { |client| client.employees << self }
    # end
end
