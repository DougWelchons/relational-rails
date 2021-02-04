require 'rails_helper'

RSpec.describe "as a visitor" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")
  end
  describe "library show page" do
    it "shows the library and its information" do
      visit "/libraries/#{@library1.id}"

      expect(page).to have_content(@library1.name)
      expect(page).to have_content(@library1.city)
    end

    it "has a link to update library that takes me to the edit page" do
      visit "libraries/#{@library1.id}"

      expect(page).to have_link("Update Library")

      click_on "Update Library"
      expect(current_path).to eq("/libraries/#{@library1.id}/edit")
    end
  end
end