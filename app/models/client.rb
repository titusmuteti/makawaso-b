class Client < ApplicationRecord
    # has_secure_password

    has_many :bills 
    has_and_belongs_to_many :employees

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    # validates :password, presence: true, length: { in: 6..20 }
end
