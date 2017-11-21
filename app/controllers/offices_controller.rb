class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offices = Office.find(params[:city, :size]).all
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
  end

  def create
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
