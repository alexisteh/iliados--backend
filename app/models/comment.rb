class Comment < ApplicationRecord
    belongs_to :word 
    belongs_to :user 
end
