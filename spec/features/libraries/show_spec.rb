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
    
    it "has a link to delete the parent" do
      visit "libraries/#{@library1.id}"
      
      expect(page).to have_link("Delete Library")
      
      click_on "Delete Library"
      
      expect(current_path).to eq("/libraries")
    end
    it "deletes the Library and all its books" do
      library2 = Library.create!(name: "Broomfield Library", city: "Broomfield")

      visit "libraries/#{@library1.id}"
      save_and_open_page
      click_on "Delete Library"

      expect(page).to have_no_content(@library1.name)
      expect(page).to have_content(library2.name)
      save_and_open_page
    end
  end
end