class OrderItemsController < ApplicationController
  def index
    @order = Order.find(params[:id])
    @orderDetails = @order.order_items
  end

  def create
    @item = OrderItem.new
    @item.item = params[:item]
    @item.price = params[:price]
    @item.quntity = params[:quntity]
    @item.comment = params[:comment]
    @item.order_id = params[:order_id]
    @item.user_id = current_user.id

    if  @item.save
      InvitedUser.where(user_id: current_user.id, order_id: @item.order_id).update_all(status: "true")
      require 'pusher'
      pusher = Pusher::Client.new(
        app_id: '982999',
        key: '2bd7d28e1b0bab57da91',
        secret: '6c02fa5838d3dc945a12',
        cluster: 'mt1',
        encrypted: true
      )
      order_creator = Order.find(@item.order_id).user_id
      pusher.trigger('my-channel', "#{order_creator}", {
        message: "#{current_user.first_name} joined your order",
        action_url: "/orders/#{@item.order_id}/items",
        img: "#{current_user.image}",
        notificationType: "view"

      })
      Notification.create({
        user_id: order_creator,
        content: "#{current_user.first_name} joined your order",
        actionURL: "/orders/#{@item.order_id}/items",
        seen: false,
        img: "#{current_user.image}",
        notificationType: "view "
      })
      redirect_to order_details_path(id: @item.order_id)
    else
      puts (@item.errors.full_messages)
      redirect_to :root
    end

  end

  def destroy
    order_item = OrderItem.find(params[:id])
    order_id = order_item.order_id
    order_item.destroy
    redirect_to order_details_path(id: order_id)
  end

end
