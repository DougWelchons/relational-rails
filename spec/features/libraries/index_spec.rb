require 'rails_helper'

RSpec.describe "as a visitor" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette")
    @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield")
    
    @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
    @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
    @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
    @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)
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

    describe "Library's books index" do
      describe "as a visitor" do
        it "shows all of the books and its attributes for the library" do
          visit "/libraries/#{@library1.id}/books"

          expect(page).to have_content(@library1.name)
          
          within("#book-#{@cat.id}") do
            expect(page).to have_content(@cat.name)
            expect(page).to have_content(@cat.available)
            expect(page).to have_content(@cat.pages)
          end
    
          within("#book-#{@stand.id}") do
            expect(page).to have_content(@stand.name)
            expect(page).to have_content(@stand.available)
            expect(page).to have_content(@stand.pages)
          end
          
          expect(page).to have_no_content(@xmas.name)
          expect(page).to have_no_content(@war.name)
        end
      end
    end
  end
end