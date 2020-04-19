class Group < ApplicationRecord
  # belongs_to :user
  # has_many :group_friends, :join_table => "group_friends" ,dependent: :destroy
  has_and_belongs_to_many :users

end
