require 'rails_helper'

RSpec.describe "as a visitor" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 20, open: false)
  end
  describe "When I visit the Library show page" do
    it "has a form to update the Library"do
      visit "/libraries/#{@library1.id}/edit"

      expect(page).to have_field(:name)
      expect(page).to have_field(:city)
      expect(page).to have_field(:years_open)
      expect(page).to have_field(:open)
   end
    describe "When I fill out the form with updated information and submit" do
      it "updates the library's information and redirects to the show page show the updates" do
        visit "/libraries/#{@library1.id}/edit"

        fill_in :name, :with => "Broomfield Library"
        fill_in :city, :with => "Broomfield"
        fill_in "years_open", :with => "15"
        check(:open)

        click_on "Update Library"

        expect(current_path).to eq("/libraries/#{@library1.id}")

        expect(page).to have_content("Broomfield Library")
        expect(page).to have_content("Broomfield")
        expect(page).to have_content("15")
        expect(page).to have_content("true")
        expect(page).to have_no_content("Lafayette Library")
        expect(page).to have_no_content("Lafayette")
        expect(page).to have_no_content("20")
        expect(page).to have_no_content("false")
      end
    end
  end
end