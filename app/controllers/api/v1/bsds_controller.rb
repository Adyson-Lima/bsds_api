class Api::V1::BsdsController < ApplicationController

  #before_action :set_bsd, only: %i[] # show update destroy

  def index
    @bsds = Bsd.all 
    render json: @bsds
  end

private

def set_bsd
  @bsd = Bsd.find(params[:id])
end

def bsd_params
  params.require(:bsd).permit(:name, :description)
end

end