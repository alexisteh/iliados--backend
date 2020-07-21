class Comment < ApplicationRecord
    belongs_to :word 
    belongs_to :user 

    validates :user_id, presence: true
    validates :content, presence: true
    validates :word_id, presence: true 
end
