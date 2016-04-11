class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => t(:welcome)
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to root_url, :notice => t(:red_user)
      else
        render 'edit'
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :authentications_attributes, :location)
  end
end
