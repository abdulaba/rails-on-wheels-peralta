class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show]
  def index
    @vehicles = Vehicle.all
  end

  def show; end

  def new
  end

  def create
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
end
