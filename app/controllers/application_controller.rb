class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :number_people, :user_id, :office_id)
  end
end
