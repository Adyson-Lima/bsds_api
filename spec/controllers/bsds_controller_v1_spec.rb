require 'rails_helper'

RSpec.describe Api::V1::BsdsController, type: :controller do

  before{@bsd = Bsd.create(name: 'netbsd', description: 'bsd muito compativel')}

  describe 'GET /api/v1/bsds' do
    it 'Consegue listar todos os bsds e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end