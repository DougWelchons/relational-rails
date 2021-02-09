require 'rails_helper'

RSpec.describe "Library Index Page" do
  before(:each) do
    @library1 = Library.create!(name: "Lafayette Library", city: "Lafayette", years_open: 20, open: true)
    @library2 = Library.create!(name: "Broomfield Library", city: "Broomfield", years_open: 20, open: true)
    @library3 = Library.create!(name: "Denver Library", city: "Denver", years_open: 20, open: true)
    
    @cat = @library1.books.create!(name: "Cat in the Hat", available: true, pages: 61)
    @stand = @library1.books.create!(name: "The Stand", available: true, pages: 1308)
    @xmas = @library2.books.create!(name: "Christmas Carol", available: true, pages: 66)
    @war = @library2.books.create!(name: "War and Peace", available: false, pages: 1225)
  end
  
  describe "as a visitor" do
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
    
    it "shows the libraries in order of most recently created with the creation time next to it" do
      visit "/libraries"
      
      within('#ordered-libraries') do
        expect(@library3.name).to appear_before(@library2.name)
        expect(@library2.name).to appear_before(@library1.name)
      end
    end
    
    it "has a link to the edit library page" do
      visit "/libraries"
      
      within("#library-#{@library1.id}") do
        expect(page).to have_link("Edit Library")
        click_on "Edit Library"
        expect(current_path).to eq("/libraries/#{@library1.id}/edit")
      end
    end

    it "has a link to the delete library" do
      visit "/libraries"
      
      within("#library-#{@library1.id}") do
        expect(page).to have_link("Delete Library")
        click_on "Delete Library"
        expect(current_path).to eq("/libraries")
      end
      expect(page).to_not have_content(@library1.name)
    end
    
    it "has it a link to All Books" do
      visit "/libraries"

      expect(page).to have_link("All Books")
    end
    
    it "has it a link to All Libraries" do
      visit "/libraries"

      expect(page).to have_link("All Libraries")
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