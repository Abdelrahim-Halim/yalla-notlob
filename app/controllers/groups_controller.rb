class GroupsController < ApplicationController
    # before_action :set_params, only: [:show, :edit, :update, :destroy]
    def index
        @group = Group.new
        # @group = Group.where(user_id: current_user.id)
        @group = Group.where(user_id: User.find(1))
    end

    def new
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
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy
        flash[:notice] = "Group is destroyed successfully"
        redirect_to :groups
    end



    private

    # def set_params
    #   @group = Group.find(params[:id])
    # end

end
