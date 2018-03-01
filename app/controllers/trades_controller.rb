class TradesController < BaseController
  include JSONAPI::Utils

  def index
    jsonapi_render json: Trade.all
  end

  # POST /trade
  def create
    if converter.is_a? Array
      jsonapi_render json: converter.compact
    else
      render json: converter.error, status: :unprocessed_entity
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
        file: params.dig(:data, :attributes, :file)
      )
    save_trades(@converter.call).call
  end

  def trade_params
    params.require(:user).permit(:file)
  end

  def save_trades(trades)
    @saver ||= Trades::Save.new(
      trades: trades
    )
  end
end
