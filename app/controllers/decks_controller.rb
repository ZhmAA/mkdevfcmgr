class DecksController < ApplicationController
  def index
    @decks = current_user.decks
  end

  def show
    @deck = current_user.decks.find(params[:id])
    @cards = @deck.cards
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.new(deck_params)
    if @deck.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @deck = current_user.decks.find(params[:id])
  end

  def update
    @deck = current_user.decks.find(params[:id])
    if @deck.update(deck_params)
      redirect_to action: :index
    else
      render :index
    end
  end

  def delete
    @deck = Deck.find(params[:id])
  end

  def destroy
    Deck.find(params[:id]).destroy
    redirect_to action: :index
  end

  private

  def deck_params
    params.require(:deck).permit(:title, :user_id, :current)
  end
end
