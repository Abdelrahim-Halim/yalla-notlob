class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend Devise::Models
  mount_uploader :image 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :notifications
  has_many :orders
  has_many :order_items
  has_many :invited_users
  has_many :user_activities
  has_and_belongs_to_many :groups



  validates_presence_of   :image
  validates_integrity_of  :image
  validates_processing_of :image

  #frinds relationship
  has_and_belongs_to_many :friendships,
  :class_name => "User",
  :join_table => "friendships",
  :foreign_key => "friend_a_id",
  :association_foreign_key => "friend_b_id",
  :before_add => :validates_friend,
  dependent: :destroy
 
end
