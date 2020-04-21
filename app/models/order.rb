class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items,:dependent => :delete_all
  has_many :invited_users,:dependent => :delete_all
  has_many :user_activities,:dependent => :delete_all

  validates :order_type, presence: true, :inclusion => {:in => ["breakfast","lunch","dinner"]}
  validates :resturant, presence: true
  validates :menu, presence: true
end
