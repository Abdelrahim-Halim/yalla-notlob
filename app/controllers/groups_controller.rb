class GroupsController < ApplicationController
    # before_action :set_params, only: [:show, :edit, :update, :destroy]
    def index
        @user_friends = User.find(1).friendships   
        @group = Group.new
        # @group = Group.where(user_id: current_user.id)
        @group = Group.where(user_id: User.find(1))
        # @groupUsers = Group.where(user_id: User.find(1),group_id: params[:id])
    end

    def new
        @group = Group.new
    end 

    def create
        @new_group = Group.new()
        # @new_group.user_id = current_user.id
        
        @new_group.user_id = User.find(1).id
        @new_group.name = params[:group][:name]
        if Group.find_by(name: params[:group][:name] , user_id: User.find(1).id)
            flash[:error] = "this group is already exist"
            redirect_to :groups
        else
            @new_group.save
            p @new_group
            if @new_group.persisted?
                flash[:notice] = "Your Group is created successfully "
                redirect_to :groups
            elsif @new_group.nil?
                flash[:error] = "you must enter group name"
                redirect_to :groups
            end
        end
    end

    def show
        @group = Group.find(params[:id])



    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        flash[:notice] = "Group is destroyed successfully"
        redirect_to :groups
    end

    def addFriendToGroup

        user = User.find(1) #current_user
        @new_friend = user.friendships.find_by(email: params[:user][:email])
        group = Group.find(params[:id])
        # @group_user = GroupFriend.find_by(user_id: @new_friend.id ,group_id: params[:id])
        p @new_friend
        if user.friendships.include? @new_friend
          @group_user = GroupFriend.find_by(user_id: @new_friend.id ,group_id: params[:id]) 
          if @group_user.nil?
            @group_user =GroupFriend.create(user_id: @new_friend.id , group_id: params[:id])
            @group_user.save
            p @group_friends
            flash[:notice] = "user is added to group sucessfully"
            redirect_to group_path
          else
             flash[:error] = "user already in the group"
             redirect_to group_path
          end
        else
            flash[:error] = "this user doesn't exist"
            redirect_to :group
        end

        # @new_friend = Friendship.create(friend_a_id: 1 , friend_b_id: @new_friend.id)
        # @new_friend.save
        # group = Group.find(params[:gid])
        # @group_user = group.group_friends.find_by(user_id: params[:uid],group_id: params[:gid])

        # if @new_user.exist?
        #     if @group_user.nil?
        #         @new_friend1 = Group_friend.create(user_id: params[:uid] , group_id: params[:gid])
                
        #         if @new_friend1.save
        #            flash[:notice] = "Your friend is added successfully "
        #            redirect_to :group
        #         else
        #         #    flash[:notice] = @group.errors
        #            redirect_to :group
        #         end
        #     else
        #        flash[:error] = "user already in the group"
        #        redirect_to :group
        #     end    
 
        # else
        #     flash[:error] = "this user doesn't exist"
        #     redirect_to :group
        # end

    end


    # @new_friend = Friendship.create(friend_a_id: 1 , friend_b_id: @new_friend.id)
    # @new_friend.save

    def removeFriendFromGroup

        @group_user =  GroupFriend.find(params[:id])
        @group_user.destroy
        flash[:notice] = "Removed friend from this group."
        # redirect_to group_path(params[:group_id])
        redirect_to groups_path
    end
    
# end



    # private

    # def set_params
    #   @group = Group.find(params[:id])
    # end

end

# @group_user = GroupUser.find(params[:id])
# @group_user.destroy
# redirect_to group_path(params[:group_id])