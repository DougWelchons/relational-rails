require 'rails_helper'

# User story 9
RSpec.describe "Offroad_vehicles edit page" do
  describe "when I visit an offroad_vehicles show page" do
    it "has a link to to update the vehicle" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "/offroad_vehicles/#{vehicle.id}"

      expect(page).to have_link("Update Vehicle")
      click_link "Update Vehicle"

      expect(current_path).to eq("/offroad_vehicles/#{vehicle.id}/edit")
    end
  end

  describe "when I visit an offroad_vehicles edit page" do
    it "shows a form populated with the vehicles info" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "/offroad_vehicles/#{vehicle.id}/edit"

      expect(find_field(name: "name").value).to eq(vehicle.name)
      expect(find_field(name: "make").value).to eq(vehicle.make)
      expect(find_field(name: "model").value).to eq(vehicle.model)
      expect(find_field(name: "tire_size").value.to_i).to eq(vehicle.tire_size)
      expect(find_field(name: "passed_safety_inspection").value).to eq("1") #revisit this test line
    end

    it "should redirect me to the ORV show page when the form is submitted" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "/offroad_vehicles/#{vehicle.id}/edit"
      fill_in "tire_size", with: 40
      click_button "Update Vehicle"

      expect(current_path).to eq("/offroad_vehicles/#{vehicle.id}")

      expect(page).to have_content(vehicle.name)
      expect(page).to have_content("Tire size 40 inches")
    end
  end
end
