class FriendshipsController < ApplicationController
    def index
        @user_friends = User.find(1).friendships   
        @friends = []
        @user_friends.each do |fri|
          users = User.find(fri.friendship_ids)
          @friends.push(users)
        end 
     
    end
    def new
        # create new fiendships object
        @new_friend = User.new
        @user_friends = User.find(1).friendships  
         
    end
    def show
      @user_friends = User.find(1).friendships  
    end    
      def create
      
        @user_friends = User.find(1).friendships   
        
        @new_friend = User.find_by(email: params[:user][:email])
        p @new_friend
        user = User.find(1)
        if @new_friend == nil
          @error = "user doesnot exist"
          render :new
        elsif @new_friend.id == 1
          @error = "this is your email"
          render :new
        else
          if user.friendships.include? @new_friend
            @error = "this user already in your friends zone"
            render :new
          else
            p @new_friend.id
            # user.friendships << @new_friend.id
            @new_friend = Friendship.create(friend_a_id: 1 , friend_b_id: @new_friend.id)
            @new_friend.save
            flash[:notice] = 'Friend was successfully created.'
            p @user_friends
            redirect_to :friendships
          end
        end
       
      end
    
      def destroy

        # User.find(1).friendships.destroy(User.find(params[:id]))
        # @friendship = current_user.friendships.find(params[:id])
        # @friendship =Friendship.find(friend_a_id: 1, friend_b_id: params[:id])
        # p @friendship
        # @friendship.destroy

        if User.find(1).friendships.delete(params[:id])
           flash[:notice] = "Removed friendship."
        end
        redirect_to :friendships
      end
end

