class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offices = Office.where(city: params[:city]).where(size: params[:size])
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new

    if @office.save
      redirect_to @office
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:office).permit(:city, :size, photo: []) # to be filled
  end
end
