class OrderController < ApplicationController
  def new
    require 'json'
    @order = Order.new
    current_user = User.find(1)

    # get all friends
    friends = current_user.friendships()
    puts "test" 
    friendsArr = Array.new()
    friends.each do |f| 
      data = {  id: User.select('id').find(id=f.friend_b_id).id, 
                first_name: User.select('first_name').find(id=f.friend_b_id).first_name, 
                last_name: User.select('last_name').find(id=f.friend_b_id).last_name, 
                email: User.select('email').find(id=f.friend_b_id).email,
                image: User.select('image').find(id=f.friend_b_id).image,
              }
      friendsArr.push data
    end
    @friendsArrjs = friendsArr.to_json

    # get all groups 
    groups = current_user.groups
    groupsArr = Array.new()
    groups.each do |f| 
      data = {  id: f.id, 
                name: f.name 
              }
      groupsArr.push data
    end
    @groupsArrjs = groupsArr.to_json

  end
  
  def create
    current_user = User.find(1)
    puts params
    @order = Order.new(orderParameters)
    @order.user_id = current_user.id
    @order.status = "waiting"
    @order.menu = params[:order][:menu].original_filename
    if !@order.save
      render("new")
    end
    uploaded_io = params[:order][:menu]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    # create order
    order = Order.create(user_id: current_user.id,resturant: params[:order][:resturant], order_type: params[:order][:order_type], menu: uploaded_io.original_filename, status: "waiting")

    # invite friends
    friendsWillInvite = params[:mailValues] 
    friendsWillInvite.split(',').each do |email| 
      friend = User.where(email: email)
     
      if friend.length > 0 && Friendship.where(friend_a: current_user.id, friend_b: friend[0].id).count() > 0
        invite(friend[0].id, order.id)
      end
    end

    # invite groups
    groupsWillInvite = params[:groupValues] 
    groupsWillInvite.split(',').each do |groupName| 
      group = groups.where("name = ? AND user_id = ?", groupName, current_user.id)
      if users.length == 0
        continue
      end
      group.group_friends.each do |user|
        invite(user.id, order.id)
      end
    end
    
    # redirect to order page
  end

  private
    def orderParameters
      params.require(:order).permit(:order_type, :resturant, :menu)
    end
    def invite(user_id, order_id)
      # send notification 

      InvitedUser.create(user_id: user_id,order_id: order_id)
    end
  
end
