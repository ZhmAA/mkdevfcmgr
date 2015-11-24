#require 'pry'
class HomeController < ApplicationController
  
  def index
    @card = Card.random_card
  end

  def check
    #binding.pry
    @card = Card.find(params[:card_id])
    if @card.original_text == params[:card][:original_text]
      redirect_to action: :index
    else
      flash.now[:error] = "Не правильно"
      render :index
    end
  end
  
end
