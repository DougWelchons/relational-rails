class Member < ApplicationRecord
  has_many :offroad_vehicles, :dependent => :destroy

  def orv_list(size)
    orv = offroad_vehicles.all

    orv.find_all do |vehicle|
      vehicle.tire_size >= size.to_i
    end
  end
end
