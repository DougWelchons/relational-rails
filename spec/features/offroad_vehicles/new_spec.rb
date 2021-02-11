require 'rails_helper'

# user story 11
RSpec.describe 'members/:id/offroad_vehicles/new page' do
  describe "when I visit the offroad vehicles index page" do
    it 'shows a link to add a new offroad vehicle' do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}/offroad_vehicles"

      expect(page).to have_link("Add a new vehicle")
    end
  end

  describe 'when I visit offroad_vehicles/new page' do
    it "shows a form for creating a new ORV" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}/new_orv"

      expect(page).to have_field(name: "name")
      expect(page).to have_field(name: "make")
      expect(page).to have_field(name: "model")
      expect(page).to have_field(name: "tire_size")
      expect(page).to have_field(name: "passed_safety_inspection")
    end

    it "redirects me to the ORV index when I submit the form" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}/new_orv"

      fill_in "name", with: "BigBoi"
      fill_in "make", with: "Jeep"
      fill_in "model", with: "something"
      fill_in "tire_size", with: 37
      click_button "Create Vehicle"
      expect(current_path).to eq("/offroad_vehicles/#{member.offroad_vehicles.first.id}")

      expect(page).to have_content("BigBoi")
    end
  end
end
