class AddMembersToOffroadVehicles < ActiveRecord::Migration[5.2]
  def change
    add_reference :offroad_vehicles, :member, foreign_key: true
  end
end
