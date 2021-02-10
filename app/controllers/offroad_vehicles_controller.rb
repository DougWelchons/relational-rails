class OffroadVehiclesController < ApplicationController
  before_action :set_vehicle, only: [:edit, :show]

  def index
    if params[:id]
      @member = Member.find(params[:id])
      @orv = @member.offroad_vehicles
    else
      orv = OffroadVehicle.all
      @orv = orv.find_all do |vehicle|
        vehicle.passed_safety_inspection == true
      end
    end
  end

  def show
    @vehicle = OffroadVehicle.find(params[:id])
  end

  def edit
    @vehicle = OffroadVehicle.find(params[:id])
  end

  def destroy
    vehicle = OffroadVehicle.find(params[:id])
    member_id = vehicle.member.id
    OffroadVehicle.destroy(params[:id])
    redirect_to "/members/#{member_id}/offroad_vehicles"
  end

  def update
    vehicle = OffroadVehicle.find(params[:id])

    vehicle.update({
      name: params[:offroad_vehicles][:name],
      make: params[:offroad_vehicles][:make],
      model: params[:offroad_vehicles][:model],
      tire_size: params[:offroad_vehicles][:tire_size],
      passed_safety_inspection: status_check(params[:offroad_vehicles][:passed_safety_inspection])
      })

    vehicle.save

    redirect_to "/offroad_vehicles/#{vehicle.id}"
  end

  def create
    member = Member.find(params[:member_id])
    vehicle = member.offroad_vehicles.new({
      name: params[:offroad_vehicles][:name],
      make: params[:offroad_vehicles][:make],
      model: params[:offroad_vehicles][:model],
      tire_size: params[:offroad_vehicles][:tire_size],
      passed_safety_inspection: status_check(params[:offroad_vehicles][:passed_safety_inspection])
      })

    vehicle.save

    redirect_to "/offroad_vehicles/#{vehicle.id}"
  end

  def set_vehicle
    @vehicle = OffroadVehicle.find(params[:id])
  end
end
