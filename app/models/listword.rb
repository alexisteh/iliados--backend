class Listword < ApplicationRecord
    belongs_to :savedword 
    belongs_to :savelist 
end
