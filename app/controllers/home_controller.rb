class HomeController < ApplicationController
  
  def index
    if current_user.decks.current.any? 
      @deck = current_user.decks.current.take
      @card = @deck.cards.random_cards.take
    else
      @card = current_user.cards.random_cards.take
    end
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
