class HomeController < ApplicationController
  def index
  end

  def addFriend
    render "home/addFriend"
  end

  def addGroup
    render "home/addGroup"
  end
  
end
