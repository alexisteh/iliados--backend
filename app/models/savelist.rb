class Savelist < ApplicationRecord
    belongs_to :user 
    has_many :listwords  
end
