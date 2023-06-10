class Client < ApplicationRecord
    # has_secure_password

    has_many :employee_client
    has_many :employees, through: :employee_clients, class_name: 'Employee'

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, length: { in: 6..20 }
end
