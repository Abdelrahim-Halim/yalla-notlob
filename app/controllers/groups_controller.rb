class GroupsController < ApplicationController
    # before_action :set_params, only: [:show, :edit, :update, :destroy]
    def index
        @user_friends = User.find(1).friendships   
        @group = Group.new
        # @group = Group.where(user_id: current_user.id)
        @groupUsers = Group.where(user_id: User.find(1),group_id: params[:id])
    end

    def new
        @group = Group.new
    end 

    def create
        @new_group = Group.new
        # @new_group.user_id = current_user.id
        @new_group.user_id = User.find(1)
        @new_group.name = params[:name]
        @new_group.save
        if @new_group.persisted?
          flash[:notice] = "Your Group is created successfully "
          redirect_to :groups
        elsif @new_group.nil?
          flash[:error] = "you must enter group name"
          redirect_to :groups
        end
    end

    def show
        # @group = Group_friend.where(user_id: User.find(1), group_id: params[:id])
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
        @new_user = user.friendships.find_by(email: params[:user][:email])
        group = Group.find(params[:id])
        @group_user = group.group_friends.find_by(email: params[:user][:email])

        if @new_user.exist?
            if @group_user.nil?
                if group.users << @new_user
                   flash[:notice] = "Your friend is added successfully "
                   redirect_to group_path(params[:id])
                else
                   flash[:notice] = @group.errors
                   redirect_to :group
                end
            else
               flash[:error] = "user already in the group"
               redirect_to :group
            end    
 
        else
            flash[:error] = "this user doesn't exist"
            redirect_to :group
        end

    end

    # def destroy

    #     @group_user =  Group.find(params[:gid])
    #     @group_user.group.users.destroy(User.find(params[:uid]))
    #     flash[:notice] = "Removed friend from this group."
    #     redirect_to :group_users

    # end
    
# end



    # private

    # def set_params
    #   @group = Group.find(params[:id])
    # end

end
