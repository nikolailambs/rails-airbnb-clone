class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @offices = Office.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@offices) do |office, marker|
      marker.lat office.latitude
      marker.lng office.longitude
      # marker.infowindow render_to_string(partial: "/offices/map_box", locals: { office: flat })
    end
  end

  def show
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
    params.require(:office).permit("#", photo: []) # to be filled
  end
end
