class Member < ApplicationRecord
  has_many :offroad_vehicles, :dependent => :destroy

  def orv_list(size = nil)
    if size
      offroad_vehicles.where("tire_size > #{size}")
    else
      offroad_vehicles
    end
  end
end
