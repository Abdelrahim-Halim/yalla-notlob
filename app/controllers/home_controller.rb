class HomeController < ApplicationController
  def index
  end

  def addFriend
    render "home/addFriend"
  end
end
