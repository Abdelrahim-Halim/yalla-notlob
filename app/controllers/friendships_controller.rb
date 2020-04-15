class FriendshipsController < ApplicationController
    def index
        @user_friends = User.find(1).friendships    
    end
    def new
        # create new fiendships object
        @new_friend = User.new
        @user_friends = User.find(1).friendships  
         
      end
    
      def create
        @user_friends = User.find(1).friendships   
       
        @new_friend = User.find_by(email: params[:user][:email])
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
            user.friendships << @new_friend
            
            redirect_to :friendships
          end
        end
       
      end
    
      def destroy
    
        # @friendship = current_user.friendships.find(params[:id])
        @friendship = User.find(1).friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = "Removed friendship."
        redirect_to :friendships
      end
end

# @friendship = current_user.friendships.build(:friend_id => @friend.id)
# if @friendship.save
#   @res = { error: false, message: @friend.name+" added to your friend list" }
# else
#   @res = { error: true, message: "Unable to add "+@friend.email+" to your friend list" }
# end
