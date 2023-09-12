class GroupsController < ApplicationController
  def index
    if current_user
      @user = current_user
      @groups = @user.groups.includes(:purchases)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
