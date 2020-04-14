class HomeController < ApplicationController
  def index
    
  end

  def addFriend
    # store data
    @newfriend = User.new
    render "home/addFriend"
     
  end

  def addNewFriend
    render "home/addFriend"
  end

  def addGroup
    render "home/addGroup"
  end
  
end
