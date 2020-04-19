class Friendship < ApplicationRecord
  # belongs_to :friend_a, class_name: :User
  # belongs_to :friend_b, class_name: :User ,dependent: :destroy
  # self.table_name = 'friendships'
  # belongs_to :user, foreign_key: 'friend_a_id', class_name: 'User'
  # belongs_to :friendship, foreign_key: 'friend_b_id', class_name: 'User'
end
