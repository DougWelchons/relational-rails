require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "when I visit the libraries index page" do
    it "shows all of the libraries in the system" do
      library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")
      library2 = Library.create!(name: "Broomfield Library", city: "Broomfield")

      visit "/libraries"

      expect(page).to have_content(library1.name)
      expect(page).to have_content(library2.name)
    end
  end
end