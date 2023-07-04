class Client < ApplicationRecord
    has_secure_password
  
    has_many :employee_clients
    has_many :employees, through: :employee_clients
  
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password, presence: true, confirmation: true
  
end

# class Client < ApplicationRecord
#   belongs_to :employee

#   validates :first_name, presence: true, length: { maximum: 255 }
#   validates :last_name, presence: true, length: { maximum: 255 }
#   validates :email, presence: true, length: { maximum: 255 }, uniqueness: true
#   validates :phone_number, presence: true
#   validates :password, presence: true
#   validates :employee_id, presence: true

#   has_secure_password
# end

  