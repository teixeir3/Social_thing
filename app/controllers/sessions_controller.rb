class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])

    if @user
      signin(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def destroy
    signout(current_user)
    render :new
  end
end
