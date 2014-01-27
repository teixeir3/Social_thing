class FriendCirclesController < ApplicationController
  def create
    @user = User.find(params[:user_id])

    ActiveRecord::Base.transaction do
      @circle = FriendCircle.new(name: params[:friend_circle][:name], owner_id: @user.id)
      @circle.save
      @circle.member_ids = params[:friend_circle][:friends]
    end

    redirect_to user_url(@user)
  end

  def edit
    @circle = FriendCircle.find(params[:user_id])
    @user = @circle.owner
  end

  def show
    @circle = FriendCircle.find(params[:user_id])
    @members = @circle.members
  end

  def update

    render :show
  end
end
