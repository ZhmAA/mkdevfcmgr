class CardsController < ApplicationController
    
  def index
    @cards = current_user.cards
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = current_user.cards.new
  end

  def create
    @card = current_user.cards.new(card_params)
    if @card.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to action: :index
    else
      render :index
    end
  end

  def delete
    @card = Card.find(params[:id])
  end

  def destroy
    Card.find(params[:id]).destroy
    redirect_to action: :index
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date, :user_id, :avatar)
  end
end
