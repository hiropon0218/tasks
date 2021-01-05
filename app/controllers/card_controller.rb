class CardController < ApplicationController
  before_action :set_card, only: %i(show edit update destroy)

  def new
    @card = Card.new
    @list = List.find_by(id:params[:list_id])
  end

  def create
    @card = Card.new(card_params_create)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update_attributes(card_params_update)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to :root
  end

  private
    def set_card
      @card = Card.find_by(id:params[:id])
    end

    def card_params_create
      params.require(:card).permit(:title, :memo).merge(list_id: params[:list_id])
    end

    def card_params_update
      params.require(:card).permit(:title, :memo, :list_id)
    end


end