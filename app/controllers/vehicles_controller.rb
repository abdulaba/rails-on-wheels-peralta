class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show]
  def index
    @vehicles = Vehicle.all
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
  end

  def update
  end

  def delete
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.require("vehicle").permit(:make, :model, :year, :price, :seats, :vehicle_type, :description, :photos)
  end
end
