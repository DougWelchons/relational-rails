require 'rails_helper'
RSpec.describe 'as a visitor' do
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

    # it "should have a link to update the member" do
    #   member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
    #
    #   visit "/members/#{member1.id}/offroad_vehicles"
    #   save_and_open_page
    #
    #   # expect(page).to have_link("/members/#{member1.id}/new_orv")
    # end
  end
end
