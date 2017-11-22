class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @offices = Office.where({city: params[:city], size: params[:size]})

    @hash = Gmaps4rails.build_markers(@offices) do |office, marker|
      marker.lat office.latitude
      marker.lng office.longitude
      marker.infowindow render_to_string(partial: "/offices/map_box", locals: { office: flat })
    end
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
    params.require(:office).permit(:size, :address, :city, :price, :period, :description, :facility_standard, :available_from, :available_to, photos: [])
  end
end
