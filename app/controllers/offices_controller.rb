class OfficesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    #dummy

    if params.has_key?(:search)
      search = params[:search]

      if !search[:address_search].blank?
        @offices = Office.near(search[:address_search], 20).where(size: search[:size_search])
      else
        @offices = Office.all
      end

    else
      @offices = Office.all
    end

    respond_to do |format|
      format.html
      format.json
    end

    @hash = Gmaps4rails.build_markers(@offices) do |office, marker|
      marker.lat office.latitude
      marker.lng office.longitude
      marker.infowindow render_to_string(partial: "/offices/map_box", locals: { office: office })
    end

  end

  def show
    @office = Office.find(params[:id])
    @message = Message.new
    @booking = Booking.new
    @review = Review.new
      respond_to do |format|
        format.html
        format.js
        format.json
      end

    if params[:booking]
      @booking.attributes = booking_params
      @invalid = !@booking.valid?
    end

    @hash = Gmaps4rails.build_markers([@office]) do |office, marker|
      marker.lat office.latitude
      marker.lng office.longitude
      marker.infowindow render_to_string(partial: "/offices/map_box", locals: { office: office })
    end
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
    params.require(:office).permit(:name, :city, :size, :address, :price, :period, :office_type, :description, :facility_standard, :available_from, :available_to, photos: [])
  end
end
