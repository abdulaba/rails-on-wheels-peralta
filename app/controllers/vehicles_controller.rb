class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[show edit update destroy rents]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @vehicles = Vehicle.all
    if params[:query].present?
      @vehicles = Vehicle.search_by_mark_model_and_year(params[:query])
    end
  end

  def my_vehicles
    @vehicles = current_user.vehicles
  end

  def show; end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    @vehicle.save ? redirect_to(vehicle_path(@vehicle)) : render(:new, status: :unprocessable_entity)
  end

  def edit
    redirect_to(vehicle_path(@vehicle)) if current_user != @vehicle.user
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle), notice: "Datos actualizados exitosamente"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to vehicles_path, notice: "Vehiculo borrado exitosamente"
  end

  def rents
    @rents = @vehicle.rents
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require("vehicle").permit(:make, :model, :year, :price, :seats, :vehicle_type, :description, photos: [])
  end
end
