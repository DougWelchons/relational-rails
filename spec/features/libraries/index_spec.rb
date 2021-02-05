require 'rails_helper'

RSpec.describe "as a visitor" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")
    @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield")
  end
  describe "when I visit the libraries index page" do
    it "shows all of the libraries in the system" do

      visit "/libraries"

      expect(page).to have_content(@library1.name)
      expect(page).to have_content(@library2.name)
    end

    it "has a link to create a new library record" do
      visit "/libraries"

      expect(page).to have_link("New Library")

      click_on "New Library"

      expect(current_path).to eq("/libraries/new")
    end
  end
end