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


    #frinds relationship
    has_and_belongs_to_many :friendships,
    :class_name => "User",
    :join_table => "friendships",
    :foreign_key => "friend_a_id",
    :association_foreign_key => "friend_b_id",
    :before_add => :validates_friend,
    dependent: :destroy

  # def friendships
  #   self.friendships_as_friend_a + self.friendships_as_friend_b
  # end
  
#  attr_accessor :first_name ,:last_name, :email, :password,  :image, :image_cache, :remove_image
=======

>>>>>>> git commit -m "delete all comments from users and groups controller"

 
end
