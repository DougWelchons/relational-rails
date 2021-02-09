require 'rails_helper'

# User story 5
RSpec.describe "Member Delete story" do
  describe "When I visit a parent show page" do
    it "shows a link to delete that Member" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}"

      expect(page).to have_link("Delete")
    end
  end

  describe "When I click the delete link" do
    it "sould delete the member and redirect me to the member index page" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"Jason", premium_member:true, skill_level:4)
      member3 = Member.create!(name:"Philip", premium_member:false, skill_level:1)

      visit "/members/#{member2.id}"

      click_link("Delete")

      expect(current_path).to eq("/members")
      expect(page).to have_content(member1.name)
      expect(page).to_not have_content(member2.name)
      expect(page).to have_content(member3.name)
    end
  end
end
