class RentsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]

  def index
    @rents = current_user.rents
  end

  def show
  end

  def new
    @rent = Rent.new
  end

  def create
    @rent = Rent.new(rent_params)
    @rent.user = current_user

    if @rent.save
      redirect_to @rent, notice: 'Renta creada exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @rent.update(rent_params)
      redirect_to @rent, notice: 'Renta actualizada exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @rent.destroy
    redirect_to rents_url, notice: 'Renta eliminada exitosamente.'
  end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    # Define los parámetros permitidos para crear o actualizar una renta
    params.require(:rent).permit(:vehicle_id, :start_date, :end_date, :other_params)
  end
end
