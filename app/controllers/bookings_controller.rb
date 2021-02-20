class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings.order("id DESC")
  end

  # def show
  #   @appartment = Appartment.find(@booking.appartment_id)
  # end

  def create
    @appartment = Appartment.find(params[:appartment_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.appartment = @appartment
    if @booking.save
      redirect_to bookings_path
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to request.referrer
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
