class OrderItemsController < ApplicationController
  def index
    @order = Order.find(params[:id])
    @current_user = User.find(2)
    @orderDetails = @order.order_items
  end

  def create
    @item = OrderItem.new
    @item.item = params[:item]
    @item.price = params[:price]
    @item.quntity = params[:quntity]
    @item.comment = params[:comment]
    @item.order_id = params[:order_id]
    @item.user_id = 2

    puts (@item)
    if  @item.save
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
