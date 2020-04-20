class HomeController < ApplicationController
  def index
    # @current_user = User.find(1)
    if current_user
      @orders = Order.all.where(user_id: current_user.id).order(created_at: :desc).limit(5)
      @all = []
       current_user.friendships.each { |fr|
         @all.push fr.orders
       }

       puts "All"
       puts @all.inspect
       @allmyFriends = current_user.friendships
    else
      redirect_to "/users/sign_in"
    end

  end

end
