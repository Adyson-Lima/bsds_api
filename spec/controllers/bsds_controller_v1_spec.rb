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

  describe 'GET /api/v1/bsds/id' do
    it 'Consegue listar um bsd especifico e retornar status 200?' do
      get :show, params: {id: @bsd.id}
      expect(response.body).to include_json(id: @bsd.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/bsds' do
    it 'Consegue criar um bsd e retornar status 201?' do
      post :create, params: {bsd: {name: 'openbsd', description: 'bsd muito estavel'}, format: :json}
      expect(response.body).to include_json(name: 'openbsd')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/bsds/id' do
    it 'Consegue atualizar um bsd e retornar status 200?' do
      bsd = Bsd.last
      patch :update, params: {bsd: {name: 'freebsd', description: 'bsd muito usado'}, id: bsd.id}
      expect(response.body).to include_json(name: 'freebsd')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/bsds/id' do
    it 'Consegue excluir um bsd e retornar status 204?' do
      bsd = Bsd.last
      delete :destroy, params: {id: bsd.id}
      expect(Bsd.all).not_to include(bsd)
      expect(response).to have_http_status(204)
    end
  end

end