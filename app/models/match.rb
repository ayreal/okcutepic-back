class Match < ApplicationRecord
    belongs_to :likers, foreign_key: 'user_id', class_name: 'User'
    belongs_to :likes, foreign_key: 'match_id', class_name: 'User'

  def self.is_mutual?(match1, match2)
    if match1.user_id === match2.match_id && match2.user_id === match1.match_id
      return true
    else
      return false
    end
  end

  def self.set_mutual_status(match1, match2)
    match1.mutual = true
    match1.save!
    match2.mutual = true
    match2.save!
  end

end
