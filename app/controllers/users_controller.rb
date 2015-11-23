class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: "hello #{@user.username}!"
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  protected
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
