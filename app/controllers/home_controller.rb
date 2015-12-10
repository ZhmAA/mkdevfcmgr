class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]
  
  def index
    @card = current_user.cards.random_cards.first
  end

  def check
    @card = current_user.cards.find(params[:card_id])
    if @card.check_card(params[:translate])
      p :right
      flash.now[:notice] = "Молодец!"
      redirect_to action: :index
    else
      p :wrong
      flash.now[:error] = "Не правильно"
      render :index
    end
  end
end
