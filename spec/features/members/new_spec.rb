require 'rails_helper'

# user story 3
RSpec.describe 'As a visiter' do
  describe "when i visit the member index page" do
    it 'shows a link to add a new member' do

      visit '/members'

      expect(page).to have_link(nil, href: '/members/new')
    end
  end

  describe 'when i visit members/new page' do
    it "shows a form for creating a new member" do

      visit '/members/new'

      expect(page).to have_field(name: "name")
      expect(page).to have_field(name: "skill_level")
      expect(page).to have_field(name: "premium_member")
    end

    it "redirects me to the members index when I submit the form" do
      visit '/members/new'

      fill_in "name", with: "John"
      fill_in "skill_level", with: 3
      check "premium_member"
      click_button "Create Member"
      expect(current_path).to eq("/members")

      expect(page).to have_content("John")
    end
  end
end
