class UsersController < ApplicationController
  before_filter :ensure_current_user, only: [:show, :edit]

  def new

  end

  def create
    @user = User.new(params[:user])

    if @user.save
      signin(@user)
      redirect_to user_url(@user)
    else
      flash[:notice] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      render :show
    else
      flash[:notice] = @user.errors.full_messages
      render :edit
    end
  end
end
