module Trades
  class Save < BaseService
    attr_reader :trades
    VALID_TYPE = %w[1 4]
    def initialize(trades:)
      @trades_not_persisted = trades
    end

    def process!
      ActiveRecord::Base.transaction do
        @trades =
          @trades_not_persisted.map do |trade|
            if VALID_TYPE.include?(trade[:trade_type])
              t = Trade.new(
                trade_type: trade_type(trade[:trade_type]),
                date: Time.at(trade[:date].to_i),
                price: process_price(trade[:price]),
                cpf: trade[:cpf],
                card_number: trade[:card_number],
                hour: Time.at(trade[:hour].to_i)
              )
              t.save! if t.valid?
              t
            else
              next
            end
          end
      end
    end

    def trade_type(type_number)
      case type_number
      when '1' then :debito
      when '2' then :juros
      when '3' then :financiamento
      when '4' then :credito
      when '5' then :emprestimo
      else :invalid
      end
    end

    def process_price(price)
      (price.to_i / 100).to_i
    end
  end
end
