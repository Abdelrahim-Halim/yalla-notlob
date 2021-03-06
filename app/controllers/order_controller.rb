class OrderController < ApplicationController

  def index
    
    my_orders = current_user.orders.order(created_at: :desc)
    invites = current_user.invited_users
    invited_to_orders = []
    invites.each do |invite|
        invited_to_orders.push(invite.order)
    end
    @orders = my_orders + invited_to_orders
  end

  def new

    require 'json'
    @order = Order.new

    # get all friends
    friends = current_user.friendships()
    friendsArr = Array.new()
    friends.each do |f| 
      puts f.id
      data = {  id: f.id, 
                first_name: f.first_name, 
                last_name: f.last_name, 
                email: f.email,
                image: f.image,
              }
      friendsArr.push data
    end
    @friendsArrjs = friendsArr.to_json

    # get all groups 
    groups = Group.where(user_id: current_user.id).all 
    groupsArr = Array.new()
    groups.each do |f| 
      data = {  id: f.id, 
                name: f.name 
              }
      groupsArr.push data
    end
    @groupsArrjs = groupsArr.to_json

  end

  def seen
    Notification.where(user_id: params[:id]).update_all(seen: "true")
  end
  
  def create
    # current_user = User.find(1)
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
    #order = Order.create(user_id: current_user.id,resturant: params[:order][:resturant], order_type: params[:order][:order_type], menu: uploaded_io.original_filename, status: "waiting")

    # invite friends
    friendsWillInvite = params[:mailValues] 
    friendsWillInvite.split(',').each do |email| 
      friend = User.where(email: email)
     
      if friend.length > 0 #&& Friendship.where(friend_a: current_user.id, friend_b: friend[0].id).count() > 0
        invite(friend[0].id, @order.id)
      end
    end

    # invite groups
    groupsWillInvite = params[:groupValues] 
    groupsWillInvite.split(',').each do |groupName| 
      group = Group.where("name = ?", groupName)
      if group.length == 0
        continue
      end
      group[0].users.all.each do |user|
        invite(user.id, @order.id)
      end
    end
    
    # redirect to order page
    redirect_to controller: 'order_items', action: 'index', id: @order.id
  end
  
  def show
    @order = Order.find(params[:id])
    invites = @order.invited_users
    invited_ids = []

    invites.each do |invite|
        invited_ids.push(invite.user_id)
    end
    redirect_to controller: 'order_items', action: 'index', id: @order.id
    
  end

  def finish
    @order = Order.find(params[:id])
    @order.status="finished"
    @order.save
    redirect_to :order_index
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to :order_index
  end

  private
  def orderParameters
    params.require(:order).permit(:order_type, :resturant, :menu, :user_id, :id)
  end

  def invite(user_id, order_id)
    # send notification 
    require 'pusher'
    pusher = Pusher::Client.new(
      app_id: '982999',
      key: '2bd7d28e1b0bab57da91',
      secret: '6c02fa5838d3dc945a12',
      cluster: 'mt1',
      encrypted: true
    )

    pusher.trigger('my-channel', "#{user_id}", {
      message: "#{current_user.first_name} invited you to his order",
      action_url: "/orders/#{order_id}/items",
      img: "#{current_user.image}",
      notificationType: "join"

    })
    Notification.create({
      user_id: user_id,
      content: "#{current_user.first_name} invited you to his order",
      actionURL: "/orders/#{order_id}/items",
      seen: false,
      img: "#{current_user.image}",
      notificationType: "join"
    })
    InvitedUser.create(user_id: user_id,order_id: order_id)
  end


end
