require 'rails_helper'

# user story 1
RSpec.describe "as a visitor" do
  describe "when i visit members/index" do
    it "shows each member in the system" do
      member1 = Member.create!(name:"Doug", premium_member:true, skill_level:3)
      member2 = Member.create!(name:"Sam", premium_member:false, skill_level:5)

      visit "/members"

      expect(page).to have_content(member1.name)
      expect(page).to have_content(member2.name)
    end
  end
end
