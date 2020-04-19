class GroupsController < ApplicationController

    def index
         @user_friends = User.find(1).friendships   
        @group = Group.new
        @group = Group.where(user_id: User.find(1)).all
    end

    def new
        @group = Group.new
    end 

    def create
        @new_group = Group.new()
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
        @groupUsers = @group.users.all
        @groupUsers.each do |fri|
            p fri.first_name
        end 
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
        @groupUsers = group.users.all
        p @new_friend 
        if user.friendships.include? @new_friend
          if @groupUsers.nil?
            group.users << @new_friend
            p group.users.all
            flash[:notice] = "user is added to group sucessfully"
            redirect_to group_path

          else 
            @group_user = group.users.find_by(id: @new_friend.id)  
            if @group_user.nil?
                group.users << @new_friend
                p group.users.all
                flash[:notice] = "user is added to group sucessfully"
                redirect_to group_path
            else
                flash[:error] = "user already in the group"
                redirect_to group_path
            end
        end
        else
            flash[:error] = "this user doesn't exist in your friendships"
            redirect_to :group
        end

    end


    def removeFriendFromGroup
        group = Group.find(params[:gid])
        @group_user =  group.users.delete(params[:uid])
        # @group_user.destroy
        flash[:notice] = "Removed friend from this group."
        # redirect_to group_path(params[:group_id])
        redirect_to groups_path
    end


end
