require 'rails_helper'

# User story 6

RSpec.describe "ORV index page" do
  describe "when I visit the ORV index page" do
    it "shows all of the ORV's including attrabutes" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"John", premium_member:false, skill_level:2)

      member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)
      member2.offroad_vehicles.create!(name: "BigBoi", make: "Ford", model: "F-250", tire_size: 37, passed_safety_inspection: true)
      member2.offroad_vehicles.create!(name: "Monster", make: "Jeep", model: "Gladiator", tire_size: 30, passed_safety_inspection: true)

      visit "/offroad_vehicles"

      expect(page).to have_content("Black Sheep")
      expect(page).to have_content("Jeep, Wrangler")
      expect(page).to have_content("BigBoi")
      expect(page).to have_content("Ford, F-250")
    end
  end
end
