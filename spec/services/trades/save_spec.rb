require 'rails_helper'

describe Trades::Save do
  let(:saver) { described_class.new(trades: trades) }

  let(:trades) do
    [
      {:trade_type=>'1', :date=>'48573485', :price=>'7398475938', :cpf=>'47593475938',
        :card_number=>'4753****3453', :hour=>'453453'},
      {:trade_type=>'4', :date=>'23423423', :price=>'4247772347', :cpf=>'12222123123',
        :card_number=>'3123****7687', :hour=>'345677'},
      {:trade_type=>'3', :date=>'12381729', :price=>'8371923878', :cpf=>'67777631273',
        :card_number=>'6777****1313', :hour=>'677712'}
    ]
  end

  describe '#call' do
    context 'when receive valid trades' do
      it 'creates the trades' do
        expect{ saver.call}.to change(Trade, :count).by(trades.count -1)
      end
    end

    context 'when receive invalid trades' do
      let(:wrong_trades) do
        [
          {:trade_type=>'9', :date=>'', :price=>'7398475938', :cpf=>'47593475938',
           :card_number=>'4753****3453', :hour=>'453453'},
          {:trade_type=>'4', :date=>'23423423', :price=>'4247772347', :cpf=>'12222123123',
           :card_number=>'31237687', :hour=>''},
        ]
      end

      it 'raises and error' do
        expect{ saver.call}.to change(Trade, :count).by(0)
      end
    end
  end
end
