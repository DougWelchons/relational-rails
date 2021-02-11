class Member < ApplicationRecord
  has_many :offroad_vehicles, :dependent => :destroy

  def orv_list(info = {tire_size: nil, sort: nil})
    list = offroad_vehicles
    list = offroad_vehicles.where("tire_size > #{info[:tire_size]}") if info[:tire_size]
    list = list.order(:name) if info[:sort]
    list
  end
end
