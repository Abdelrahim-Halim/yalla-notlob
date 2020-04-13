class OrderController < ApplicationController
  def new
    @order = Order.new
  end
  
  def create
    puts params
  end
  
end
