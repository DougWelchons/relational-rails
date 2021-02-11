class OffroadVehiclesController < ApplicationController
  before_action :set_vehicle, only: [:edit, :show, :update]

  def set_vehicle
    @vehicle = OffroadVehicle.find(params[:id])
  end

  def index
    if params[:id]
      @member = Member.find(params[:id])
      @orv = @member.orv_list(tire_size: params[:select_tire_size], sort: params[:alphabetical])
    else
      @orv = OffroadVehicle.where(passed_safety_inspection: true)
    end
  end

  def create
    member = Member.find(params[:member_id])
    vehicle = member.offroad_vehicles.new({
      name: params[:name],
      make: params[:make],
      model: params[:model],
      tire_size: params[:tire_size],
      passed_safety_inspection: status_check(params[:passed_safety_inspection])
      })

    vehicle.save

    redirect_to "/offroad_vehicles/#{vehicle.id}"
  end

  def update
    @vehicle.update({
      name: params[:name],
      make: params[:make],
      model: params[:model],
      tire_size: params[:tire_size],
      passed_safety_inspection: status_check(params[:passed_safety_inspection])
      })

    redirect_to "/offroad_vehicles/#{@vehicle.id}"
  end

  def destroy
    vehicle = OffroadVehicle.find(params[:id])
    member_id = vehicle.member.id
    OffroadVehicle.destroy(params[:id])
    redirect_to "/members/#{member_id}/offroad_vehicles"
  end
end
