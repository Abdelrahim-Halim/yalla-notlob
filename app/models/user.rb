class User < ApplicationRecord
    has_many :groups
    has_many :orders
    has_and_belongs_to_many :users
    has_many :notifications
    has_many :order_items
    has_many :invited_users
    has_and_belongs_to_many :group_friends
end
