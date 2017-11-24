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
      redirect_to office_path(@office, booking: booking_params)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
