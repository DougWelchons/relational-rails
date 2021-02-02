require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "library show page" do
    it "shows the library and its information" do
      library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")

      visit "libraries/#{library1.id}"

      expect(page).to have_content(library1.name)
      expect(page).to have_content(library1.city)
    end
  end
end