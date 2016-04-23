class Dashboard::UserSessionsController < ApplicationController

  def destroy
    logout
    redirect_to root_path, notice: t(:logout_notice)
  end
end
