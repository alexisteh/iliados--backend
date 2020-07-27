class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :password, presence: true 

    has_many :comments 
    has_many :savedwords 

    has_many :savelists 
end 
