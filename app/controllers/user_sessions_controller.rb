class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to root_path, notice: t(:success_enter)
    else
      flash.now[:alert] = t(:error_login)
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t(:logout_notice)
  end
end
