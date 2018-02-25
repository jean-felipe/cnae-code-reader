require 'rails_helper'

describe Trades::Convert do
  let(:converter) { described_class.new(file: file) }

  let(:file) do
    path = File.join(Rails.root, 'spec', 'support', 'cnab-test.txt')
    Rack::Test::UploadedFile.new(path, 'text/plain')
  end

  describe '#call' do
    before(:each) { converter.call }
    context 'when send a file to be converter' do
      it 'converts the file and create the trades' do
        expect(converter.trades).to be_a(Array)
        expect(converter.trades).to include(include(:type, :date, :price, :cpf, :card, :hour))
      end
    end
  end
end
