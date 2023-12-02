require 'rails_helper'

RSpec.describe Bsd, type: :model do

  before{@bsd = Bsd.new}

  describe 'Testes de preenchimento do model Bsd' do

    it 'name consegue ser preenchido?' do
      @bsd.name = 'openbsd'
      expect(@bsd.name).to eq('openbsd')
    end

  end

end