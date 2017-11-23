class BookingsController < ApplicationController
  def index
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @office = Office.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.office = @office

    if @booking.save
      redirect_to @booking
    else
      render office_path(@office)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :number_people)
  end
end
