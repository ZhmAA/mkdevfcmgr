class Dashboard::HomeController < ApplicationController
  
  def index
    if current_user.decks.current.any? 
      @deck = current_user.decks.current.take
      @card = @deck.cards.random_cards.take
    else
      @card = current_user.cards.random_cards.take
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def check
    @card = current_user.cards.find(params[:card_id])
    if @card.check_card(params[:translate])
      p :right
      redirect_to root_url, notice: "Правильно!"
    elsif @card.levenshtein_algorithm(params[:translate])
      p :right
      redirect_to root_url, notice: "Правильно! Но есть опечатка"
    else
      p :wrong
      flash.now[:error] = "Не правильно"
      render :index
    end
  end
end
