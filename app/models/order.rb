class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items
    has_many :invited_users
end
