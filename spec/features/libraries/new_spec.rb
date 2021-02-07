require 'rails_helper'

RSpec.describe "as a visitor" do
  describe "Library new page" do
    describe "When I create a new Library" do
      it "creates a new library record" do
        visit "/libraries/new"

        fill_in :name, :with => "Lafayette Library"
        fill_in :city, :with => "Lafayette"
        fill_in :years_open, :with => "20"
        check(:open)

        click_on "Create Library"

        expect(current_path).to eq("/libraries")

        expect(page).to have_content("Lafayette Library")
        expect(page).to have_content("Library")
      end
    end
  end
end

# Then a `POST` request is sent to the '/parents' route,
# and I am redirected to the Parent Index page where I see the new Parent displayed.