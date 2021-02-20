class AppartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_appartment, only: [:show, :edit, :update, :destroy]

  def index
    # if params[:search][:address].empty?
    #   @appartments = Appartment.near(Geocoder.search(remote_ip).first.city, 250, :order => :distance)
    # end
    # if params[:search][:start_date].present? && params[:search][:end_date].present?
    nearest_appartments = Appartment.near(params[:search][:address], 250, :order => :distance)
    @appartments = nearest_appartments.select { |appartment| appartment.available?(appartment, params[:search][:start_date], params[:search][:end_date]) }
    # end
  end

  def user_appartments
    if current_user.appartments.empty?
      render 'new'
    else
      @appartments = current_user.appartments
    end
  end

  def show
    @booking = Booking.new
    @bookings = Booking.where(appartment_id: @appartment.id)
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
  end

  def new
    @appartment = Appartment.new
  end

  def create
    @appartment = Appartment.new(appartment_params)
    @appartment.user_id = current_user.id
    @appartment.save

    redirect_to appartment_path(@appartment)
  end

  def update
  end

  def destroy
  end

  private

  def set_appartment
    @appartment = Appartment.find(params[:id])
  end

  def appartment_params
    params.require(:appartment).permit(:address, :price, :photo)
  end

  # def nearest_appartments
  #   if params[:search][:address].empty?
  #     @appartments = Appartment.near(Geocoder.search(remote_ip).first.city, 250, order: :distance)
  #   end
  #   @appartments = Appartment.near(params[:address], 250, :order => :distance)
  # end
end
