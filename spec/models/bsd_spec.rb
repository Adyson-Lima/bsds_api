require 'rails_helper'

RSpec.describe Bsd, type: :model do

  before{@bsd = Bsd.new}

  describe 'Testes de preenchimento do model Bsd' do

    it 'name consegue ser preenchido?' do
      @bsd.name = 'openbsd'
      expect(@bsd.name).to eq('openbsd')
    end

    it 'description consegue ser preenchido?' do
      @bsd.description = 'bsd muito seguro'
      expect(@bsd.description).to eq('bsd muito seguro')
    end

  end

  describe 'Testes de validacao do model Bsd' do

    it 'Bsd valido com campos obrigatorios preenchidos?' do
      @bsd.name = 'freebsd'
      @bsd.description = 'bsd muito popular'
      expect(@bsd).to be_valid
    end

  end

end