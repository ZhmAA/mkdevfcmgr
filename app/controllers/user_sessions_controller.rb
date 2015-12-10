class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to root_path, notice: 'Вход прошел успешно'
    else
      flash.now[:alert] = 'Почта или пароль указаны неверно'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Вы вышли из аккаунта!'
  end
end
