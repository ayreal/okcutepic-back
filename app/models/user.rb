class User < ApplicationRecord
  # has_secure_password
  has_many :matches
  has_many :liker_relationships, foreign_key: :likes_id, class_name: 'Match'
  has_many :likers, through: :liker_relationships, source: :liker
  has_many :likes_relationships, foreign_key: :user_id, class_name: 'Match'
  has_many :likes, through: :likes_relationships, source: :likes
  has_many :user_interests
  has_many :interests, through: :user_interests
end
