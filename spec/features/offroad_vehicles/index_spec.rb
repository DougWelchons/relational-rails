require 'rails_helper'

# User story 6 & 14
RSpec.describe "ORV index page" do
  describe "when I visit the offroad vehicle index page" do
    it "shows all of the ORV's including attrabutes that have a passed safety inspection" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"John", premium_member:false, skill_level:2)

      member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: false)
      member2.offroad_vehicles.create!(name: "BigBoi", make: "Ford", model: "F-250", tire_size: 37, passed_safety_inspection: true)

      visit "/offroad_vehicles"

      expect(page).to have_content("Black Sheep")
      expect(page).to have_content("Jeep, Wrangler")
      expect(page).to have_content("BigBoi")
      expect(page).to have_content("Ford, F-250")
      expect(page).to_not have_content("Dragon-Alligator")
    end
  end

  describe "when I visit a members offroad vehicles page" do
    # User Story 7
    it "shows a list of off road vehicles belonging to that member" do
      member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)
      member2 = Member.create!(name: "John", premium_member: false, skill_level: 2)

      member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)
      member2.offroad_vehicles.create!(name: "BigBoi", make: "Ford", model: "F-250", tire_size: 37, passed_safety_inspection: true)
      member2.offroad_vehicles.create!(name: "Monster", make: "Jeep", model: "Gladiator", tire_size: 30, passed_safety_inspection: true)

      visit "/members/#{member1.id}/offroad_vehicles"

      expect(page).to have_content("Black Sheep")
      expect(page).to have_content("Jeep, Wrangler")
      expect(page).to_not have_content("BigBoi")
      expect(page).to_not have_content("Ford, F-250")
    end

    # User Stroy 15
    it "should have a form to select a tire size" do
      member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)

      visit "/members/#{member1.id}/offroad_vehicles"

      expect(page).to have_field("select_tire_size")
    end

    it "Should return only vehicles with tire sizes larger then the specified size when submitted" do
      member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)

      member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)

      visit "/members/#{member1.id}/offroad_vehicles"

      fill_in "select_tire_size", with: 35
      click_button "find all vehicles with a tire size grater then:"

      expect(current_path).to eq("/members/#{member1.id}/offroad_vehicles")
      expect(page).to have_content("Dragon-Alligator")
      expect(page).to_not have_content("Black Sheep")
    end

    # User Story 16
    it "shoud have a button to sort all of the members vehicles alphabetically" do
      member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)
      vehicle1 = member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      vehicle2 = member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)
      vehicle3 = member1.offroad_vehicles.create!(name: "BigBoi", make: "Ford", model: "F-250", tire_size: 37, passed_safety_inspection: true)

      visit "/members/#{member1.id}/offroad_vehicles"

      expect(page).to have_button("Sort Alphabeticaly")

      click_button "Sort Alphabeticaly"

      expect(vehicle3.name).to appear_before(vehicle1.name)
      expect(vehicle1.name).to appear_before(vehicle2.name)
    end

    # User Story 20
    it "should have a link next to each vehicle to edit that vehicle" do
      member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)
      vehicle1 = member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      vehicle2 = member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)

      visit "/offroad_vehicles"

      expect(page).to have_link("edit_id_#{vehicle1.id}")
      expect(page).to have_link("edit_id_#{vehicle2.id}")
    end

    # User Story 21
    it "should have a link next to each vehicle to delete that vehicle" do
      member1 = Member.create!(name: "Doug", premium_member: true, skill_level: 3)
      vehicle1 = member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)
      vehicle2 = member1.offroad_vehicles.create!(name: "Dragon-Alligator", make: "Jeep", model: "Gladiator", tire_size: 37, passed_safety_inspection: true)

      visit "/offroad_vehicles"

      expect(page).to have_link("delete_id_#{vehicle1.id}")
      expect(page).to have_link("delete_id_#{vehicle2.id}")
    end
  end
end
