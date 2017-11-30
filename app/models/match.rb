class Match < ApplicationRecord
    belongs_to :likers, foreign_key: 'user_id', class_name: 'User'
    belongs_to :likes, foreign_key: 'match_id', class_name: 'User'
end
