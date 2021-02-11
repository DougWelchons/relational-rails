require 'rails_helper'

# User story 2
RSpec.describe 'Members show page' do
  describe "When I visit '/members/:id'" do
    it "should show the member and all of it's attributes" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member1.id}"

      expect(page).to have_content(member1.id)
      expect(page).to have_content(member1.name)
      expect(page).to have_content(member1.premium_member)
      expect(page).to have_content(member1.skill_level)
      expect(page).to have_content(member1.created_at)
      expect(page).to have_content(member1.updated_at)
    end

    # User Story 13
    it "should show the number of assosiated Offroad Vehicles" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      vehicle = member1.offroad_vehicles.create!(name: "Black Sheep", make: "Jeep", model: "Wrangler", tire_size: 33, passed_safety_inspection: true)

      visit "/members/#{member1.id}"

      expect(page).to have_content("Number of off-road vehicles registered = 1")
    end
  end
end
