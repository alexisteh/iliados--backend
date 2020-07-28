class Savedword < ApplicationRecord
    belongs_to :user 
    belongs_to :word 
    has_many :listwords 
end
