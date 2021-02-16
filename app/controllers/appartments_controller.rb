class AppartmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_appartment, only: [:show, :edit, :update, :destroy]

  def index
    @appartments = Appartments.all
  end

  def show; end

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
    params.require(:appartment).permit(:address, :price)
  end
end
