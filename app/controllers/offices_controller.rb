class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

  end

  def show
    @office = Office.find(params[:id])
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user
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

  def office_params
    params.require(:office).permit(:size, :address, :city, :price, :period, :description, :facility_standard, :available_from, :available_to, photos: []) # to be filled
  end
end
