class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @office = Office.find(params[:office_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.office = @office


    if @booking.save
      redirect_to bookings_path
    else
      render office_path(@booking.office)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :number_people, :user_id, :office_id)
  end
end
