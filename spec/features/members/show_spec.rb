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
  end
end
