class FriendshipsController < ApplicationController
    def index
        p current_user
        @user_friends = current_user.friendships 
        @friends = []
        @user_friends.each do |fri|
          users = User.find(fri.friendship_ids)
          @friends.push(users)
        end 
     
    end
    def new
        @new_friend = User.new
        @user_friends = current_user.friendships  
         
    end
    def show
      @user_friends = current_user.friendships 
    end    
      def create
      
        @user_friends = current_user.friendships   
        
        @new_friend = User.find_by(email: params[:user][:email])
        p @new_friend
        if @new_friend == nil
          @error = "user doesnot exist"
          render :new
        elsif @new_friend.id == current_user.id
          @error = "this is your email"
          render :new
        else
          if current_user.friendships.include? @new_friend
            @error = "this user already in your friends zone"
            render :new
          else
            p @new_friend.id
            
            @new_friend = Friendship.create(friend_a_id: current_user.id , friend_b_id: @new_friend.id)
            @new_friend.save
            flash[:notice] = 'Friend was successfully created.'
            p @user_friends
            redirect_to :friendships
          end
        end
       
      end
    
      def destroy
        if current_user.friendships.delete(params[:id])
           flash[:notice] = "Removed friendship."
        end
        redirect_to :friendships
      end
end

