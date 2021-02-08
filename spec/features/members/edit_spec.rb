require 'rails_helper'

# User story 4
RSpec.describe "member edit page" do
  describe "when I visit the member show page" do
    it "has a link to update the Member 'Update Member'" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}"

      expect(page).to have_link("Update Member")

      click_link("Update Member")

      expect(current_path).to eq("/members/#{member.id}/edit")
    end
  end

  describe "when I visit the member edit page" do
    it "shows a form populated with the member's information" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}/edit"

      expect(find_field(name: "member[name]").value).to eq(member.name)
      expect(find_field(name: "member[skill_level]").value.to_i).to eq(member.skill_level)
      expect(find_field(name: "member[premium_member]").value).to eq("on") #revisit this test line
    end

    it "should redirect me to the member show page when the form is submitted" do
      member = Member.create!(name:"Doug", premium_member:true, skill_level:3)

      visit "/members/#{member.id}/edit"
      fill_in "member[skill_level]", with: 4
      click_button "update_member"

      expect(current_path).to eq("/members/#{member.id}")
      expect(page).to have_content(member.name)
      expect(page).to have_content("Skill level = 4")
    end
  end
end
