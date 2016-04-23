class Dashboard::UsersController < ApplicationController
  
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
