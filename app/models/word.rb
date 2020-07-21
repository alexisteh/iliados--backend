class Word < ApplicationRecord
    has_many :comments 
    validates :location, presence: true
    validates :location, uniqueness: true
    validates :content, presence: true 
end
