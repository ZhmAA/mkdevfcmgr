class CardsController < ApplicationController
  
  def index
  	@cards = Card.all
  end

  def show

  end

end
