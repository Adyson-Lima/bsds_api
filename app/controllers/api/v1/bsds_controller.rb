class Api::V1::BsdsController < ApplicationController

  before_action :set_bsd, only: %i[show update] # show update destroy

  def index
    @bsds = Bsd.all 
    render json: @bsds
  end

  def show
    render json: @bsd
  end

  def create
    @bsd = Bsd.new(bsd_params)
    if @bsd.save
      render json: @bsd, status: :created, location: api_v1_bsd_url(@bsd)
    else
      render json: @bsd.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bsd.update(bsd_params)
      render json: @bsd
    else
      render json: @bsd.errors, status: :unprocessable_entity
    end
  end

private

def set_bsd
  @bsd = Bsd.find(params[:id])
end

def bsd_params
  params.require(:bsd).permit(:name, :description)
end

end