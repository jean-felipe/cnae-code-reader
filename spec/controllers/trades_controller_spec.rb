require 'rails_helper'

RSpec.describe TradesController, type: :controller do

  describe "GET #index" do
    before do
      @trades = create_list(:trade, 5)
    end

    shared_examples_for 'filtering index endpoint' do
      it 'returns http success' do
        get :index, params: filter
        expect(response).to have_http_status(:success)
        expect_json('data.0', type: 'trades')
      end
    end

    context 'filtering by cpf' do
      let(:filter) do
        { 
          filter: { 
            cpf: @trades.last.cpf 
          }
        }
      end
      it_behaves_like 'filtering index endpoint'
    end

    context 'filtering by trade_type' do
      let(:filter) do
        { 
          filter: { 
            trade_type: @trades.last.trade_type 
          }
        }
      end
      it_behaves_like 'filtering index endpoint'
    end

    context 'filtering by value' do
      let(:filter) do
        { 
          filter: { 
            price: @trades.last.price 
          }
        }
      end
      it_behaves_like 'filtering index endpoint'
    end

    context 'filtering by card_number' do
      let(:filter) do
        { 
          filter: { 
            card_number: @trades.last.card_number
          }
        }
      end
      it_behaves_like 'filtering index endpoint'
    end
  end

  describe "#create" do
    let(:file) do
      path = File.join(Rails.root, 'spec', 'support', 'cnab-test.txt')
      Rack::Test::UploadedFile.new(path, 'text/plain')
    end

    let(:params) do
      {
        data: {
          type: 'trades',
          attributes: {
            file: file
          }
        }
      }
    end

    it "returns http success" do
      post :create, params: params
      expect(response).to have_http_status(:success)
      expect_json('data.0', type: 'trades')
      expect(
        json.dig('data', 0, 'attributes', 'trade-type')
      ).to eq('debito')
    end

    it 'creates a new trade' do
      expect{ post :create, params: params }.to change(Trade, :count).by(2)
    end
  end

  describe "GET #show" do
    xit "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    xit "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    xit "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
