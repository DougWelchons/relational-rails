require 'rails_helper'

# User story 10
RSpec.describe "offroad_vehicles/:id/destroy" do
  describe "when I visit an offroad_vehicle show page" do
    it "has a link to delete that vehicle" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "/offroad_vehicles/#{vehicle.id}"

      expect(page).to have_link("Delete Vehicle")
    end

    it "deletes the vehicle and redirects to the offroad_vehicle index page when the link is clicked" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "/offroad_vehicles/#{vehicle.id}"
      click_link("Delete Vehicle")

      expect(current_path).to eq("/members/#{member.id}/offroad_vehicles")
      expect(page).to_not have_content(vehicle.name)
    end
  end
end
