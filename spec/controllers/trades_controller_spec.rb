require 'rails_helper'

RSpec.describe TradesController, type: :controller do

  describe "GET #index" do
    xit "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
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
      require 'pry'; binding.pry
      post :create, params
      require 'pry'; binding.pry
      expect(response).to have_http_status(:success)
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
