require 'pry'

class HomeController < ApplicationController
  
  def index
    @card = Card.new
    @cards = Card.where('review_date > ?', Time.current).limit(1).order("RANDOM()")
  end

  def check
    binding.pry
    @card = Card.find(params[:card_id])
    if @card.original_text == params[:original_text]
      redirect_to action: :index
    else
      flash.now[:error] = "Не правильно"
      render :index
    end
  end
  
end
