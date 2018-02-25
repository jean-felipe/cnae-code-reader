class TradeController < ApplicationController
  def index
  end

  # POST /trade
  def create
    if converter.call
      jsonapi_render json: converter.trades
    else
      jsonapi_render json: converter.error, status: :unprocessed_entity
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def converter
    @converter ||=
      Trades::Convert.new(
        file: params[:file]
      )
  end
end
