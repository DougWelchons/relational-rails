require 'rails_helper'

# user story 1 & 12
RSpec.describe "as a visitor" do
  describe "when I visit the members index page" do
    it "shows each member in the system sorted by created at date" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"Sam", premium_member:false, skill_level:5)

      visit "/members"

      expect(page).to have_content(member2.name)
      expect(page).to have_content(member1.name)
      expect(member2.name).to appear_before(member1.name)
    end

    # User Story 18
    it "should have a link next to each member to edit that member" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"Sam", premium_member:false, skill_level:5)

      visit "/members"

      expect(page).to have_link("edit_id_#{member1.id}")
      expect(page).to have_link("edit_id_#{member2.id}")

      expect(find_link("edit_id_#{member2.id}")).to appear_before(find_link("edit_id_#{member1.id}"))
    end

    # User Story 19
    it "should have a link next to each member to delete that member" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"Sam", premium_member:false, skill_level:5)

      visit "/members"

      expect(page).to have_link("delete_id_#{member1.id}")
      expect(page).to have_link("delete_id_#{member2.id}")

      expect(find_link("delete_id_#{member2.id}")).to appear_before(find_link("delete_id_#{member1.id}"))
    end

    it "Should have a search field" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"Sam", premium_member:false, skill_level:5)

      visit "/members"

      expect(page).to have_field("search")

      fill_in "search", with: "am"
      click_button"Search Records"

      expect(page).to have_content(member2.name)
      expect(page).to_not have_content(member1.name)
    end
  end
end
