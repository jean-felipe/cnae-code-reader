module Trades
  class Convert < BaseService
    attr_reader :trades
    def initialize(file:)
      @file = file
    end

    def process!
      @trades =
        File.open(@file.tempfile).map do |line|
          {
            trade_type: line[0],
            date: line[1..8],
            price: line[9..18],
            cpf: line[19..29],
            card_number: line[30..41],
            hour: line[42..47]
          }
        end
    end
  end
end
