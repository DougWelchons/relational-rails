require 'rails_helper'

# User story 8
RSpec.describe "Offroad_vehicle/:id" do
  describe "When I visit the ORV show page" do
    it "shows the vehicle and its attributes" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "offroad_vehicles/#{vehicle.id}"

      expect(page).to have_content(vehicle.name)
      expect(page).to have_content(vehicle.make)
      expect(page).to have_content(vehicle.model)
      expect(page).to have_content(vehicle.tire_size)
    end
  end
end
