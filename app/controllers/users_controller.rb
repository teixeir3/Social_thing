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
    @friend_circles = @user.owned_circles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    else
      flash[:notice] = @user.errors.full_messages
      render :edit
    end
  end

  def reset_password
    @token = params[:email_token]
    @user = User.find_by_id(params[:id])


    if @token == @user.email_token
      redirect_to edit_user_url(@user)
    else
      flash[:notice] = "AN ERROR OCCURED"
      redirect_to login_url
    end
  end

  def send_password_email
    @user = User.find_by_email(params[:user][:email])
    msg = UserMailer.reset_password_email(@user)
    msg.deliver!
  end
end
