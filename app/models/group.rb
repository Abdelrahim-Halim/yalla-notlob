class Group < ApplicationRecord
  belongs_to :user
  has_many :group_friends, :join_table => "group_friends" ,dependent: :destroy
  # validates :name, presence: true
  # belongs_to :owner, class_name: 'User' ,foreign_key: 'admin_id'
  # has_and_belongs_to_many :group_friends, :join_table => "group_friends"

end
