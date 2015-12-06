class UserSessionsController < ApplicationController
  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Вход прошел успешно')
    else
      flash.now[:alert] = 'Почта или пароль указаны неверно'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Вы вышли из аккаунта!')
  end
end
