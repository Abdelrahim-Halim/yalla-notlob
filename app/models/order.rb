class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :invited_users
  has_many :user_activities

  validates :order_type, presence: true, :inclusion => {:in => ["breakfast","lunch","dinner"]}
  validates :resturant, presence: true
  validates :menu, presence: true
end
